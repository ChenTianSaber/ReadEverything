import 'package:get/get.dart';

import 'html.controller.dart';

class HtmlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HtmlController>(
      () => HtmlController(),
    );
  }
}
