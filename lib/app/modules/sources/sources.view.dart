import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:work/utils/dialog_util.dart';

import 'sources.controller.dart';

class SourcesView extends GetView<SourcesController> {
  const SourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('添加源'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Step1",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "请输入要添加的 url 地址",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoTextField(
                  controller: controller.urlEditController,
                ),
                SizedBox(
                  height: 36,
                ),
                Text(
                  "Step2",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "👇 请选取解析规则",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 26,
                    child: ElevatedButton(
                      onPressed: () => controller.chooseRule(),
                      // TODO 跳转代码编辑器页
                      onLongPress: () => DialogUtil.showToast("查看代码，施工中"),
                      child: Text(
                        controller.ruleHtml.value.isNotEmpty ? "已选择: ${controller.ruleTitle.value}" : "选取规则",
                        style: TextStyle(fontSize: 12),
                      ),
                    )),
                SizedBox(
                  height: 36,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.saveSource(),
                      child: Text("添加"),
                    ))
              ],
            ),
          )),
    );
  }
}
