import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageViewerController extends GetxController {
  RxList<String> images = <String>[].obs;
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    try {
      images.value = Get.arguments["imageList"] as List<String>;
      currentIndex.value = Get.arguments["index"] as int;
    } catch (_) {}
    pageController = PageController(initialPage: currentIndex.value);
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
