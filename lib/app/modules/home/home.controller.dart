import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/db/db_server.dart';
import 'package:work/app/data/db/sp_server.dart';
import 'package:work/app/modules/home/home.view.dart';
import 'package:work/app/plugin/reader_data_manager.dart';

class HomeController extends GetxController {
  /// 数据 List
  RxList<ReaderData> libraryDataList = RxList([]);
  RxList<ReaderData> historyDataList = RxList([]);
  RxList<ReaderData> collectionDataList = RxList([]);

  final browser = ChromeSafariBrowser();

  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ItemScrollController itemScrollController = ItemScrollController();

  Rx<int> curIndex = 1.obs;

  var bottomStateStr = "...".obs;
  var bottomUnReadStr = "".obs;

  var unreadSum = 0;

  Workers workers = Workers([]);

  StreamSubscription? _libraryReaderDataObs;
  StreamSubscription? _historyReaderDataObs;
  StreamSubscription? _collectionReaderDataObs;

  /// TODO 上次更新时间
  /// TODO 更新状态

  late PageController pageController;

  void _updateVisibleItems() {
    final positions = itemPositionsListener.itemPositions.value;
    unreadSum = libraryDataList.length - positions.last.index - 1;
    if (unreadSum > 0) {
      bottomUnReadStr.value = "\n下面还有 $unreadSum 个没看";
    } else {
      bottomUnReadStr.value = "\n已全部看完!";
    }
    if (SPServer.getLastLibraryIndex() != positions.last.index) {
      print("存入 ${positions.last.index}");
      SPServer.setLastLibraryIndex(positions.last.index);
    }
  }

  @override
  void onInit() {
    super.onInit();

    curIndex.value = SPServer.getLastTabIndex();
    pageController = PageController(initialPage: SPServer.getLastTabIndex());

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
        SPServer.setTabIndex(curIndex.value);
        print("addListener:[${pageController.page?.floor() ?? 1}]");
      }
    });

    /// 监听数据库变化
    _libraryReaderDataObs = DBServer().isar.readerDatas.filter().listTypeEqualTo(ListType.library).sortByPublishTimeDesc().build().watch(fireImmediately: true).listen((list) async {
      libraryDataList.value = list;
    });

    _historyReaderDataObs = DBServer().isar.readerDatas.filter().listTypeEqualTo(ListType.history).sortByPublishTimeDesc().build().watch(fireImmediately: true).listen((list) async {
      historyDataList.value = list;
    });

    _collectionReaderDataObs = DBServer().isar.readerDatas.filter().listTypeEqualTo(ListType.collection).sortByPublishTimeDesc().build().watch(fireImmediately: true).listen((list) async {
      collectionDataList.value = list;
    });
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  Future<void> refreshList() async {
    // 先把当前的数据移入 History 中
    for (ReaderData data in libraryDataList) {
      await DBServerReaderData.update(
          url: data.url ?? "",
          updateBuilder: (item) {
            item.listType = ListType.history;
          });
    }
    await ReaderDataManager.refreshReaderData();
  }

  @override
  void onReady() {
    super.onReady();
    print("跳转:[${SPServer.getLastLibraryIndex()}]");
    Future.delayed(Duration(milliseconds: 500), () {
      itemScrollController.jumpTo(index: SPServer.getLastLibraryIndex());
    });
  }

  @override
  void onClose() {
    itemPositionsListener.itemPositions.removeListener(_updateVisibleItems);
    workers.dispose();
    _libraryReaderDataObs?.cancel();
    _historyReaderDataObs?.cancel();
    _collectionReaderDataObs?.cancel();
    super.onClose();
  }
}
