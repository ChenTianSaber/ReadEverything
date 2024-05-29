import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:work/app/data/collections/source.dart';

import 'source_list.controller.dart';

class SourceListView extends GetView<SourceListController> {
  const SourceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('源列表'),
          centerTitle: true,
        ),
        body: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.sources.length,
            itemBuilder: (BuildContext context, int index) {
              Source source = controller.sources[index];
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${source.url}"),
                      Text("${source.ruleName}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
