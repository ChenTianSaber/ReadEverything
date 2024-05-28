import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogUtil {
  /// 展示loading
  static void showLoading() {
    SmartDialog.showLoading(maskColor: Colors.transparent);
  }

  /// 隐藏loading
  static void hideLoading() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }
}
