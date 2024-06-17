import 'package:get/get.dart';

import 'markdown.controller.dart';

class MarkdownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarkdownController>(
      () => MarkdownController(),
    );
  }
}
