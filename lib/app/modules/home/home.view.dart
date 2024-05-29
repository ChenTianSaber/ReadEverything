import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';
import 'package:work/app/routes/app_pages.dart';

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
          ElevatedButton(onPressed: () => SmartDialog.showToast("Not implement"), child: Text("展示数据")),
        ],
      )),
    );
  }
}
