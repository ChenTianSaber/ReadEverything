import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'image_viewer.controller.dart';

class ImageViewerView extends GetView<ImageViewerController> {
  const ImageViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageviewerView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: controller.images.length,
                pageController: controller.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: Axis.horizontal,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Image ${controller.currentIndex.value + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    decoration: null,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPageChanged(int index) {
    controller.currentIndex.value = index;
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(controller.images[index]),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: controller.images[index]),
    );
  }
}
