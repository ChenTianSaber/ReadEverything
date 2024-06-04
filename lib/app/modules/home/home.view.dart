import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
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
    print("_buildListItem source:[${source?.url}]");
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
                          "少数派@ChenTian - 2024.6.8 12:34:12",
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  // TODO 内容
                  ContentHtmlWidget(
                      html:
                          '''<p style="text-indent:2em;"> 今日（5月29日），多结局美少女<a target="_blank" href="https://www.3dmgame.com/tag/lianai_1/">恋爱</a>游戏《恶魔鉴定守则》Steam页面上线，游戏支持简体中文，发售日待定，感兴趣的玩家可以<a href="https://store.steampowered.com/app/2717570/Find_the_Demon/" target="_blank">点击此处</a>进入商店页面。 </p> <p style="text-indent:2em;"> </p><p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976737_853105.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p></p> <p style="text-indent:2em;"> <strong>游戏介绍：</strong> </p> <p style="text-indent:2em;"> 没有记忆的你被扔进一个古怪空间参与一场游戏。一同困在这里的三位女性将是你此行的同伴。三人都自称与你相识，且与你存在某种特殊关系。然而，若她们的自述属实，这三个人所处的世界之间显然毫无关联。你被秘密告知她们之中隐藏着一只心魔……但是，你真的有可能找出它吗? </p> <p style="text-indent:2em;"> <strong>游戏特点：</strong> </p> <p style="text-indent:2em;"> 你每天必须选择一扇“门”进入某个随机世界。你可能会在那里窥探某人的回忆、体验和某人独处的机会、遭遇意外战斗，或仅仅是经历一场古怪的探访。期间，别忘了尽可能寻找补给来缓解生存压力。 </p> <p style="text-indent:2em;"> 这里没有为你专门安排的房间，因此你每天都只能选择与一位女主角同宿。这是你调查恶魔的绝佳机会，你可以通过提出或回答问题来了解她们，进入她们的梦境，偷听她们的梦呓，寻找恶魔可能存在的破绽。 </p> <p style="text-indent:2em;"> 进入特定的世界并平安归来后，将能解锁女主角们的特殊服装。在休息时，她们可以换上特殊服装与你进行互动。 </p> <p style="text-indent:2em;"> 如果有幸存活到最后，你将获得选择【与谁共度余生】与【杀死谁】的权利，你的选择会决定每个人的命运，包括你自己。 </p> <p style="text-indent:2em;"> 在完成不同女主角的结局后，你将获得对应的特殊探险加成，帮助你更自由地探索各个未知之“门”。 </p> <p style="text-indent:2em;"> <strong>游戏截图：</strong> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976691_275612.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976691_605411.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976691_740260.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976691_641966.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976691_746146.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976692_543497.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976692_901852.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976692_512346.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976693_512769.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p> <p align="center"> <img src="https://img.3dmgame.com/uploads/images/news/20240529/1716976693_598161.jpg" alt="《恶魔鉴定守则》Steam页面上线 支持简体中文" referrerpolicy="no-referrer"> </p>'''),
                  // TODO 视频 + 图片
                  _buildImageVideoList(data),
                  // TODO url,来源
                  Text(
                    "来源: ${data.url}",
                    style: TextStyle(fontSize: 12, color: Colors.black87),
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

  Widget _buildImageVideoList(ReaderData data) {
    var width = 120.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: width,
              color: Colors.redAccent,
              child: Center(child: Text('Item 1')),
            ),
            Container(
              width: width,
              color: Colors.blueAccent,
              child: Center(child: Text('Item 2')),
            ),
            Container(
              width: width,
              color: Colors.greenAccent,
              child: Center(child: Text('Item 3')),
            ),
            Container(
              width: width,
              color: Colors.yellowAccent,
              child: Center(child: Text('Item 4')),
            ),
            Container(
              width: width,
              color: Colors.orangeAccent,
              child: Center(child: Text('Item 5')),
            ),
          ],
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
  late bool isFold;

  @override
  void initState() {
    super.initState();
    isFold = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          key: _columnKey,
          height: isFold ? 240 : null,
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
                  print("customWidgetBuilder:[${element}]");
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
