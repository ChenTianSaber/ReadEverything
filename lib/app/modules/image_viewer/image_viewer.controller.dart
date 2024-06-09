import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ImageViewerController extends GetxController {
  RxList<String> images = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    try {
      images.value = Get.arguments["imageList"] as List<String>;
    } catch (_) {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
