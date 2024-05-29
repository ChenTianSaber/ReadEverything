import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'html.controller.dart';

class HtmlView extends GetView<HtmlController> {
  const HtmlView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HtmlView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HtmlView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
