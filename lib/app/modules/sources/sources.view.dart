import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'sources.controller.dart';

class SourcesView extends GetView<SourcesController> {
  const SourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            toolbarHeight: 42,
            title: const Text(
              '添加源',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  if (controller.curStep.value == 1) {
                    controller.requestSource();
                  } else if (controller.curStep.value == 2) {
                    // TODO 保存源和数据
                  }
                },
                child: Container(
                  height: 42,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        controller.curStep.value == 1 ? '下一步' : "完成",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: controller.curStep.value == 1 ? _buildStep1Page() : _buildStep2Page()),
    );
  }

  Widget _buildStep1Page() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "🔗 添加地址",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "请输入要添加的数据源链接，可以是 RSS 地址，也可以是任意链接 (前提是有对应的解析规则，目前默认提供 RSS 解析)",
            style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black45),
          ),
          SizedBox(
            height: 16,
          ),
          CupertinoTextField(
            controller: controller.urlEditController,
          ),
        ],
      ),
    );
  }

  Widget _buildStep2Page() {
    double width = 50;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "添加规则",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: controller.source.icon?.isNotEmpty == true
                      ? Image.network(
                          fit: BoxFit.cover,
                          controller.source.icon!,
                          width: width,
                          height: width,
                        )
                      : Center(
                          child: Text(
                          controller.nameEditController.text.characters.first,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoTextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    controller: controller.nameEditController,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      controller.source.url ?? "",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
