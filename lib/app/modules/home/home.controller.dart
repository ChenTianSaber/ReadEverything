import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/db/db_server.dart';

class HomeController extends GetxController {
  /// 数据 List
  RxList<ReaderData> dataList = RxList([]);

  final browser = ChromeSafariBrowser();

  Rx<int> curIndex = 1.obs;

  /// TODO 上次更新时间
  /// TODO 更新状态

  final PageController pageController = PageController(initialPage: 1);

  @override
  void onInit() {
    super.onInit();
    DBServerReaderData.getAll().then((value) => dataList.value = value);
    pageController.addListener(() {
      if ((pageController.page?.floor() ?? 1) != curIndex.value) {
        curIndex.value = pageController.page?.floor() ?? 1;
        print("addListener:[${pageController.page?.floor() ?? 1}]");
      }
    });
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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
