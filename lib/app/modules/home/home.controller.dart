import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/db/db_server.dart';
import 'package:work/app/data/db/sp_server.dart';
import 'package:work/app/plugin/reader_data_manager.dart';

class HomeController extends GetxController {
  /// 数据 List
  RxList<ReaderData> dataList = RxList([]);

  final browser = ChromeSafariBrowser();

  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  Rx<int> curIndex = 1.obs;

  var bottomStateStr = "...".obs;
  var bottomUnReadStr = "".obs;

  var unreadSum = 0;

  Workers workers = Workers([]);

  StreamSubscription? _readerDataObs;

  /// TODO 上次更新时间
  /// TODO 更新状态

  final PageController pageController = PageController(initialPage: 1);

  void _updateVisibleItems() {
    final positions = itemPositionsListener.itemPositions.value;
    unreadSum = dataList.length - positions.last.index - 1;
    if (unreadSum > 0) {
      bottomUnReadStr.value = "\n下面还有 $unreadSum 个没看";
    } else {
      bottomUnReadStr.value = "\n已全部看完!";
    }
  }

  @override
  void onInit() {
    super.onInit();
    itemPositionsListener.itemPositions.addListener(_updateVisibleItems);
    workers.workers.add(ever(ReaderDataManager.inRefresh, (callback) async {
      StringBuffer buffer = StringBuffer();
      if (ReaderDataManager.inRefresh.value) {
        buffer.write("刷新中...");
      } else {
        buffer.write("上次更新: ${DateUtil.formatDateMs(SPServer.getLastUpdateTime())}");
        var sum = await ReaderDataManager.getFailSourceSum();
        if (sum > 0) buffer.write("\n有 $sum 个失败");
      }
      bottomStateStr.value = buffer.toString();
    }));

    pageController.addListener(() {
      if ((pageController.page?.floor() ?? 1) != curIndex.value) {
        curIndex.value = pageController.page?.floor() ?? 1;
        print("addListener:[${pageController.page?.floor() ?? 1}]");
      }
    });

    /// 监听数据库变化
    _readerDataObs = DBServer().isar.readerDatas.watchLazy(fireImmediately: true).listen((_) async {
      DBServerReaderData.getAll().then((value) => dataList.value = value);
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
    itemPositionsListener.itemPositions.removeListener(_updateVisibleItems);
    workers.dispose();
    _readerDataObs?.cancel();
    super.onClose();
  }
}
