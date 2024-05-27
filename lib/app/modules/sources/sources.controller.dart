import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class SourcesController extends GetxController {
  final TextEditingController urlEditController = TextEditingController();

  HeadlessInAppWebView? headlessWebView;

  @override
  Future<void> onInit() async {
    super.onInit();
    String htmlData = await rootBundle.loadString('assets/html/test.html');
    print("htmlData--->\n$htmlData");
    headlessWebView = HeadlessInAppWebView(
      initialData: InAppWebViewInitialData(data: htmlData),
      initialSettings: InAppWebViewSettings(isInspectable: kDebugMode),
      onWebViewCreated: (controller) {
        /// listener js data back，check data format
        controller.addJavaScriptHandler(
            handlerName: 'getReaderData',
            callback: (args) {
              print("getReaderData:--->\n$args");
            });
      },
      onConsoleMessage: (controller, consoleMessage) {
        print("onConsoleMessage:[$consoleMessage]");
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
      await headlessWebView?.webViewController?.evaluateJavascript(source: "getReaderData('${urlEditController.text}')");
      // TODO 等待getReaderData返回
      // TODO 校验类型是否为 List,内部格式是否正确，必填字段是否存在
      // TODO 校验完成，则存入数据库
    } else {
      SmartDialog.showToast("Not running");
    }
  }
}
