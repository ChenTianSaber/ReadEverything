import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'markdown.controller.dart';

class MarkdownView extends GetView<MarkdownController> {
  const MarkdownView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarkdownView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MarkdownView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
