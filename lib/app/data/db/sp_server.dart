import 'package:work/app/utils/storage_util.dart';

class SPServer {
  /// 上次更新时间
  static String get _lastUpdateTime => "last_update_time";

  static int getLastUpdateTime() {
    return StorageUtils.getItem(_lastUpdateTime) ?? DateTime.now().millisecondsSinceEpoch;
  }

  static Future<bool> setLastUpdateTime(int time) async {
    return await StorageUtils.setItem(_lastUpdateTime, time);
  }

  /// 上次打开的Tab
  static String get _lastTabIndex => "last_tab_index";

  static int getLastTabIndex() {
    return StorageUtils.getItem(_lastTabIndex) ?? 1;
  }

  static Future<bool> setTabIndex(int index) async {
    return await StorageUtils.setItem(_lastTabIndex, index);
  }

  /// Library 列表的滚动位置
  static String get _lastLibraryIndex => "last_library_index";

  static int getLastLibraryIndex() {
    return StorageUtils.getItem(_lastLibraryIndex) ?? 0;
  }

  static Future<bool> setLastLibraryIndex(int index) async {
    return await StorageUtils.setItem(_lastLibraryIndex, index);
  }

}
