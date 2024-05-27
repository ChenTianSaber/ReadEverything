import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'SourceListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
