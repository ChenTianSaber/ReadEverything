import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'sources.controller.dart';

class SourcesView extends GetView<SourcesController> {
  const SourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SourcesView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // headless webView

            TextField(
              controller: controller.urlEditController,
              decoration: InputDecoration(hintText: "输入 url"),
            ),
            ElevatedButton(onPressed: () => controller.checkData(), child: Text("验证数据")),
            ElevatedButton(onPressed: () => controller.saveSource(), child: Text("添加源"))
          ],
        ),
      ),
    );
  }
}
