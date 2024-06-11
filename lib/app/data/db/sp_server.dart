import 'package:work/app/utils/storage_util.dart';

class SPServer {
  ///存入 sp 的key
  static String get _lastUpdateTime => "last_update_time";

  static int getLastUpdateTime() {
    return StorageUtils.getItem(_lastUpdateTime) ?? DateTime.now().millisecondsSinceEpoch;
  }

  static Future<bool> setLastUpdateTime(int time) async {
    return await StorageUtils.setItem(_lastUpdateTime, time);
  }
}
