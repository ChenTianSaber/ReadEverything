import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/db/db_server.dart';

class HomeController extends GetxController {

  // 数据 List
  RxList<ReaderData> dataList = RxList([]);

  final browser = ChromeSafariBrowser();

  @override
  void onInit() {
    super.onInit();
    DBServerReaderData.getAll().then((value) => dataList.value = value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
