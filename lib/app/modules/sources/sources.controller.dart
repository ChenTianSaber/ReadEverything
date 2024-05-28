import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:work/app/data/beans/reader_data_entity.dart';
import 'package:work/utils/dialog_util.dart';
import 'package:work/utils/stream_util.dart';

class SourcesController extends GetxController {
  final TextEditingController urlEditController = TextEditingController();

  HeadlessInAppWebView? headlessWebView;

  static final StreamController<List<dynamic>> _resultStream = StreamController.broadcast();

  @override
  Future<void> onInit() async {
    super.onInit();
    String htmlData = await rootBundle.loadString('assets/rules/rss.html');
    print("htmlData--->\n$htmlData");
    headlessWebView = HeadlessInAppWebView(
      initialData: InAppWebViewInitialData(data: htmlData),
      initialSettings: InAppWebViewSettings(
        isInspectable: kDebugMode,
        javaScriptEnabled: true,
        allowUniversalAccessFromFileURLs: true,
        allowContentAccess: true,
        allowFileAccess: true,
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
                _resultStream.add(result[0]);
              } else {
                _resultStream.add([]);
              }
            });

        /// 失败
        controller.addJavaScriptHandler(
            handlerName: 'reader-fail',
            callback: (_) {
              _resultStream.add([]);
            });
      },
      onConsoleMessage: (controller, consoleMessage) {
        print("onConsoleMessage:[$consoleMessage]");
        if (consoleMessage.messageLevel == ConsoleMessageLevel.ERROR) {
          _resultStream.add([]);
        }
      },
      onLoadStart: (controller, url) async {
        print("onLoadStart:[$url]");
      },
      onLoadStop: (controller, url) async {
        print("onLoadStop:[$url]");
      },
    );
    await headlessWebView?.run();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    headlessWebView?.dispose();
    super.onClose();
  }

  /// check data format
  void checkData() async {
    if (headlessWebView?.isRunning() ?? false) {
      DialogUtil.showLoading();
      Mutex mtx = MutexFactory.getMutexForKey("getReaderData");
      await mtx.take();

      try {
        var responseStream = _resultStream.stream;
        Future<List<dynamic>> futureResponse = responseStream.first;
        await headlessWebView?.webViewController?.evaluateJavascript(source: "getReaderData('${urlEditController.text}')");

        // TODO 等待getReaderData返回
        List<dynamic> response = await futureResponse.timeout(const Duration(seconds: 180), onTimeout: () => []);
        print("=============START===============");
        List<ReaderDataEntity> entities = [];
        for (var data in response) {
          print("ori ----> $data");
          entities.add(ReaderDataEntity.fromJson(data));
        }
        print("=============END===============");
        // TODO 校验类型是否为 List,内部格式是否正确，必填字段是否存在

        // TODO 校验完成，则存入数据库
      } finally {
        mtx.give();
        DialogUtil.hideLoading();
      }
    } else {
      SmartDialog.showToast("Not running");
    }
  }
}
