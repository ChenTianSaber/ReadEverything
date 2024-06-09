import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
import 'package:path/path.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:work/app/components/keep_alive.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/collections/source.dart';
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
                          "还剩 18 未读\n上次更新: 2024-6-2 14:38:42",
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
            color: controller.curIndex.value == index ? Colors.black26.withOpacity(0.3) : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 22),
          child: Icon(
            controller.curIndex.value == index ? selectIcon : icon,
            color: controller.curIndex.value == index ? Colors.black87 : Colors.black54,
          ),
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
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.dataList.length,
          itemBuilder: (BuildContext context, int index) {
            ReaderData data = controller.dataList[index];
            return _buildListItem(data);
          },
        ));
  }

  Widget _buildListItem(ReaderData data) {
    Source? source = data.source.value;
    // print("_buildListItem source:[${source?.url}]");
    return Column(
      children: [
        Divider(height: 0.2),
        InkWell(
          onTap: () async {
            if (data.url?.isNotEmpty == true) {
              await controller.browser.open(url: WebUri(data.url ?? ""), settings: ChromeSafariBrowserSettings(shareState: CustomTabsShareState.SHARE_STATE_OFF, barCollapsingEnabled: true));
            } else {
              DialogUtil.showToast("打开失败");
            }
          },
          // TODO 展示优先级 markdown > html
          // TODO 点击则是打开 url
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO 标题
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "${data.title}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                  ),
                  // TODO 源名称 作者 时间
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 14),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0), // 设置圆角半径
                          child: Image.network('https://picsum.photos/250?image=9', width: 20, height: 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${source?.name ?? "unknown"}@${data.author} - ${DateUtil.formatDateMs(data.publishTime ?? DateTime.now().millisecondsSinceEpoch, format: DateFormats.full)}",
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  // TODO 内容
                  ContentHtmlWidget(html: '''${data.htmlContent}'''),
                  // TODO 视频 + 图片
                  _buildImageVideoList(data),
                  // TODO url,来源
                  // TODO 导出富文本展示
                  EasyRichText(
                    "来源: ${data.url}",
                    patternList: [
                      EasyRichTextPattern(
                        targetString: "来源: ",
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                      EasyRichTextPattern(
                        targetString: "${data.url}",
                        style: TextStyle(fontSize: 13, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 0.2),
        SizedBox(
          height: 16,
        )
      ],
    );
  }

  // TODO 导入 Image 和 Video 查看器
  Widget _buildImageVideoList(ReaderData data) {
    var width = 120.0;

    // TODO 测试添加图片
    List<Widget> images = [];
    for (var i = 0; i < (data.images?.length ?? 0); i++) {
      images.add(GestureDetector(
        onTap: () {
          Get.toNamed(Routes.IMAGEVIEWER, arguments: {"imageList": data.images, "index": i});
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            data.images![i],
            width: width,
            height: width,
            fit: BoxFit.cover,
          ),
        ),
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: width,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return images[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return VerticalDivider(
              width: 6,
            );
          },
          itemCount: images.length,
        ),
      ),
    );
  }
}

/// 可折叠展开的内容 Widget
class ContentHtmlWidget extends StatefulWidget {
  final String html;

  const ContentHtmlWidget({super.key, required this.html});

  @override
  State<ContentHtmlWidget> createState() => _ContentHtmlWidgetState();
}

class _ContentHtmlWidgetState extends State<ContentHtmlWidget> {
  HomeController get controller => Get.find<HomeController>();
  final GlobalKey _columnKey = GlobalKey();
  bool isFold = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          key: _columnKey,
          height: isFold ? 240 : null,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                HtmlWidget(
                  widget.html,
                  customWidgetBuilder: (element) {
                    // print("customWidgetBuilder:[${element}]");
                    if (element.localName == "p" || element.localName == "a") {
                      return null;
                    }
                    return const SizedBox.shrink();
                  },
                  customStylesBuilder: (element) {
                    // print("customWidgetBuilder:[${element}]");
                    return {'margin': '0px'};
                  },
                  renderMode: RenderMode.column,
                  onTapUrl: (url) async {
                    await controller.browser.open(url: WebUri(url), settings: ChromeSafariBrowserSettings(shareState: CustomTabsShareState.SHARE_STATE_OFF, barCollapsingEnabled: true));
                    return true;
                  },
                  textStyle: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 48,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: Get.width,
            decoration: isFold
                ? BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.6), Colors.white.withOpacity(0.8), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFold = !isFold;
                      });
                    },
                    child: Text(isFold ? "展开" : "收起"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
