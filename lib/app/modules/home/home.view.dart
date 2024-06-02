import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';
import 'package:work/app/components/keep_alive.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/routes/app_pages.dart';
import 'package:work/app/utils/dialog_util.dart';

import 'home.controller.dart';

enum ListType {
  library(0),
  history(1),
  collection(2);

  const ListType(this.value);

  final int value;
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 数据列表展示
            Expanded(child: _buildBody()),
            // 底部导航栏
            Builder(builder: (context) => _buildBottomBar(context))
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      SmartDialog.showAttach(
                        targetContext: context,
                        keepSingle: true,
                        alignment: Alignment.topLeft,
                        bindWidget: context,
                        maskColor: Colors.transparent,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            color: Colors.white,
                            width: 120,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.SOURCE_LIST);
                                    SmartDialog.dismiss();
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Center(
                                      child: Text("管理源"),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.SOURCES);
                                    SmartDialog.dismiss();
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Center(child: Text("添加源")),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text("Source"),
                  ),
                  Text("lastupdate:2024-6-2 16:58:23"),
                  Text("Refresh")
                ],
              ),
            ),
            Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.changePage(0);
                    },
                    child: Text(
                      "History",
                      style: controller.curIndex.value == 0 ? TextStyle(fontWeight: FontWeight.bold, color: Colors.red) : TextStyle(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changePage(1);
                    },
                    child: Text(
                      "Library",
                      style: controller.curIndex.value == 1 ? TextStyle(fontWeight: FontWeight.bold, color: Colors.red) : TextStyle(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changePage(2);
                    },
                    child: Text(
                      "Collection",
                      style: controller.curIndex.value == 2 ? TextStyle(fontWeight: FontWeight.bold, color: Colors.red) : TextStyle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: controller.pageController,
      children: [
        KeepAliveWrapper(child: _buildList(ListType.history)),
        KeepAliveWrapper(child: _buildList(ListType.library)),
        KeepAliveWrapper(child: _buildList(ListType.collection)),
      ],
    );
  }

  Widget _buildList(ListType type) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.dataList.length,
      itemBuilder: (BuildContext context, int index) {
        ReaderData data = controller.dataList[index];
        return InkWell(
          onTap: () async {
            if (data.url?.isNotEmpty == true) {
              // TODO 顶部元素 source 的信息
              // TODO 展示元素从上到下：title -> desc(缩起) -> markdown/html(展开) -> images/videos
              // TODO 展示优先级 markdown > html
              // TODO 点击则是打开 url
              await controller.browser.open(url: WebUri(data.url ?? ""), settings: ChromeSafariBrowserSettings(shareState: CustomTabsShareState.SHARE_STATE_OFF, barCollapsingEnabled: true));
            } else {
              DialogUtil.showToast("打开失败");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${data.title}"),
                Text("${data.url}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
