import 'package:get/get.dart';

import 'source_list.controller.dart';

class SourceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourceListController>(
      () => SourceListController(),
    );
  }
}
