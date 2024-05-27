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
      body: const Center(
        child: Text(
          'SourcesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
