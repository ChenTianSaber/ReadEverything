import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:work/app/data/beans/reader_data_entity.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/collections/source.dart';
import 'package:work/app/data/db/db_server.dart';
import 'package:work/app/modules/home/home.view.dart';
import 'package:work/app/utils/common_utils.dart';
import 'package:work/app/utils/stream_util.dart';

class ReaderDataManager {
  ReaderDataManager._internal();

  factory ReaderDataManager() => _instance;

  static final ReaderDataManager _instance = ReaderDataManager._internal();

  /// 是否处于刷新中
  static var inRefresh = false.obs;

  /// 队列是否已经初始化
  static bool _isInit = false;

  /// 无头浏览器
  static HeadlessInAppWebView? _headlessWebView;

  /// 结果监听流
  static final StreamController<List<dynamic>> resultStream = StreamController.broadcast();

  /// 创建结果监听
  static final StreamController<bool> _createStream = StreamController.broadcast();

  /// 定时拉取所有源的数据
  /// 暂时不定时
  static init() async {
    if (_isInit) {
      // 队列已经初始化
      return;
    }

    _isInit = true;

    while (_isInit) {
      await refreshReaderData();

      // 每 30分钟 执行一次
      await Future.delayed(const Duration(minutes: 30));
    }
  }

  static refreshReaderData() async {
    inRefresh.value = true;
    // 拉取所有数据
    var sources = await DBServerSource.getAll();
    for (Source source in sources) {
      if (source.ruleCode?.isNotEmpty == true) {
        var result = await _createHeadlessWebView(source.ruleCode!, source.url ?? "");

        if (!result) {
          print("_createHeadlessWebView 加载失败:[${source.url}]");
          DBServerSource.update(
              url: source.url ?? "",
              updateBuilder: (newItem) {
                newItem.updateResultType = LastUpdateType.fail;
              });
          continue;
        }

        DBServerSource.update(
            url: source.url ?? "",
            updateBuilder: (newItem) {
              newItem.updateResultType = LastUpdateType.refreshing;
            });

        if (_headlessWebView?.isRunning() == true) {
          print("开始请求数据:[${source.url}]");

          if (_headlessWebView?.isRunning() ?? false) {
            try {
              var responseStream = ReaderDataManager.resultStream.stream;
              Future<List<dynamic>> futureResponse = responseStream.first;
              await _headlessWebView?.webViewController?.evaluateJavascript(source: "getReaderData('${source.url}')");

              // 等待getReaderData返回
              List<dynamic> response = await futureResponse.timeout(const Duration(seconds: 5 * 60), onTimeout: () => []);
              print("=============START===============");
              List<ReaderData> dataList = [];
              for (var data in response) {
                var entity = ReaderDataEntity.fromJson(data);
                print("entity --> [$entity]");
                if (entity.url?.isNotEmpty == true) {
                  if (await DBServerReaderData.getSourceFromUrl(entity.url!) == null) {
                    dataList.add(entity.toReaderData(source));
                  }
                }
              }
              print("=============END===============");
              // 校验内部格式是否正确，必填字段是否存在
              if (dataList.isNotEmpty) {
                var result = await DBServerReaderData.inserts(dataList);
                print("保存完毕:[${dataList.length}] [$result]");
              }

              DBServerSource.update(
                  url: source.url ?? "",
                  updateBuilder: (newItem) {
                    newItem.updateResultType = LastUpdateType.success;
                  });
            } catch (e) {
              print("规则运行失败，请重试1");
              DBServerSource.update(
                  url: source.url ?? "",
                  updateBuilder: (newItem) {
                    newItem.updateResultType = LastUpdateType.fail;
                  });
            }
          } else {
            print("规则运行失败，请重试2");
            DBServerSource.update(
                url: source.url ?? "",
                updateBuilder: (newItem) {
                  newItem.updateResultType = LastUpdateType.fail;
                });
          }
        }
      } else {
        DBServerSource.update(
            url: source.url ?? "",
            updateBuilder: (newItem) {
              newItem.updateResultType = LastUpdateType.fail;
            });
      }
    }
    inRefresh.value = false;
  }

  static Future<bool> _createHeadlessWebView(String ruleHtml, String sourceUrl) async {
    Mutex mtx = MutexFactory.getMutexForKey("_createHeadlessWebView");
    await mtx.take();

    try {
      // 创建无头浏览器
      await _headlessWebView?.dispose();

      var responseStream = _createStream.stream;
      Future<bool> futureResponse = responseStream.first;

      _headlessWebView = HeadlessInAppWebView(
          initialData: InAppWebViewInitialData(data: ruleHtml, baseUrl: WebUri(CommonUtils.getHostLink(sourceUrl))),
          initialSettings: InAppWebViewSettings(
            isInspectable: kDebugMode,
            allowUniversalAccessFromFileURLs: true,
            allowFileAccessFromFileURLs: true,
          ),
          onWebViewCreated: (controller) {
            /// 监听 js 返回
            /// 成功
            controller.addJavaScriptHandler(
                handlerName: 'reader-success',
                callback: (result) {
                  // print("getReaderData:--->\n$result");
                  if (result.isNotEmpty) {
                    resultStream.add(result[0]);
                  } else {
                    resultStream.add([]);
                  }
                });

            /// 失败
            controller.addJavaScriptHandler(
                handlerName: 'reader-fail',
                callback: (_) {
                  resultStream.add([]);
                });
          },
          onConsoleMessage: (_, consoleMessage) {
            print("onConsoleMessage:[$consoleMessage]");
            if (consoleMessage.messageLevel == ConsoleMessageLevel.ERROR) {
              resultStream.add([]);
            }
          },
          onLoadStart: (_, url) async {
            print("onLoadStart:[$url]");
          },
          onLoadStop: (controller, url) async {
            print("onLoadStop:[$url]");
            _createStream.add(true);
          },
          onReceivedError: (_, __, ___) async {
            print("onReceivedError");
            _createStream.add(false);
          });
      await _headlessWebView?.run();

      bool response = await futureResponse.timeout(const Duration(seconds: 30), onTimeout: () => false);
      return response;
    } finally {
      mtx.give();
    }
  }

  /// 获取失败的 Source 数
  static getFailSourceSum() async {
    var sources = await DBServerSource.getAll();
    var failSum = 0;
    for (Source source in sources) {
      if (source.updateResultType == LastUpdateType.fail) {
        failSum++;
      }
    }
    return failSum;
  }
}
