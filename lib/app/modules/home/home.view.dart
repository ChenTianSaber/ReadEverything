import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/routes/app_pages.dart';
import 'package:work/utils/dialog_util.dart';

import 'home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () => Get.toNamed(Routes.SOURCES), child: Text("添加源")),
            ElevatedButton(onPressed: () => Get.toNamed(Routes.SOURCE_LIST), child: Text("管理源")),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    ReaderData data = controller.dataList[index];
                    return InkWell(
                      onTap: () async {
                        if(data.url?.isNotEmpty == true){
                          // TODO 顶部元素 source 的信息
                          // TODO 展示元素从上到下：title -> desc(缩起) -> markdown/html(展开) -> images/videos
                          // TODO 展示优先级 markdown > html
                          // TODO 点击则是打开 url
                          await controller.browser.open(
                              url: WebUri(data.url ?? ""),
                              settings: ChromeSafariBrowserSettings(
                                  shareState: CustomTabsShareState.SHARE_STATE_OFF,
                                  barCollapsingEnabled: true));
                        }else{
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
