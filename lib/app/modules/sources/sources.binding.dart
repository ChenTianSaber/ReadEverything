import 'package:get/get.dart';

import 'sources.controller.dart';

class SourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourcesController>(
      () => SourcesController(),
    );
  }
}
