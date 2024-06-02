import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogUtil {
  /// 展示loading
  static void showLoading() {
    SmartDialog.showLoading(maskColor: Colors.transparent);
  }

  /// 隐藏loading
  static void hideLoading() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  /// 展示 Toast
  static void showToast(String msg, {VoidCallback? onDismiss}) {
    SmartDialog.showToast(
      msg,
      onDismiss: onDismiss,
      alignment: Alignment.center,
      displayType: SmartToastType.last,
    );
  }

  static Future<T?> bottomSheet<T>(
      Widget bottomSheet, {
        Color backgroundColor = Colors.white,
        bool isDismissible = true,
        bool isScrollControlled = false,
        RouteSettings? settings,
      }) {
    return Get.bottomSheet<T>(
      bottomSheet,
      isScrollControlled: isScrollControlled,
      settings: settings,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: backgroundColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13.0),
          topRight: Radius.circular(13.0),
        ),
      ),
    );
  }

}
