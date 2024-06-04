import 'package:get/get.dart';

import 'image_viewer.controller.dart';

class ImageViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageViewerController>(
      () => ImageViewerController(),
    );
  }
}
