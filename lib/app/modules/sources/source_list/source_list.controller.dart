import 'package:get/get.dart';
import 'package:work/app/data/collections/source.dart';
import 'package:work/app/data/db/db_server.dart';

class SourceListController extends GetxController {
  RxList<Source> sources = RxList([]);

  @override
  void onInit() {
    super.onInit();
    DBServerSource.getAll().then((value) => sources.value = value);
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
