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

enum LastUpdateType {
  refreshing(0),
  success(1),
  fail(2);

  const LastUpdateType(this.value);

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
      () => Column(
        children: [
          Divider(
            height: 0.5,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
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
                        child: Icon(Icons.settings_suggest_outlined),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Text(
                          "lastupdate:2024-6-2 16:58:23lastupdate:2024-6-2 16:58:23lastupdate:2024-6-2 16:58:23lastupdate:2024-6-2 16:58:23",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                      GestureDetector(
                        onTap: () {
                          DialogUtil.showToast("刷新");
                        },
                        child: Icon(Icons.refresh_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomBarButton(0, Icons.access_time_outlined, Icons.access_time_filled_rounded),
                  _buildBottomBarButton(1, Icons.book_outlined, Icons.book_rounded),
                  _buildBottomBarButton(2, Icons.collections_bookmark_outlined, Icons.collections_bookmark_rounded),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomBarButton(int index, IconData icon, IconData selectIcon) {
    return GestureDetector(
      onTap: () {
        controller.changePage(index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: controller.curIndex.value == index ? Colors.grey.withOpacity(0.3) : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 22),
          child: Icon(controller.curIndex.value == index ? selectIcon : icon),
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
