import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static SharedPreferences? _spInstance;

  static init() async {
    _spInstance ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get spInstance {
    if (_spInstance == null) {
      throw Exception('使用StorageUtils之前，请先调用StorageUtils.init()初始化');
    }
    return _spInstance!;
  }

  static Future<bool> setItem(String key, dynamic value) async {
    String type;
    if (value is Map || value is List) {
      type = 'String';
      value = const JsonEncoder().convert(value);
    } else {
      type = value.runtimeType.toString();
    }

    bool success = true;

    switch (type) {
      case 'String':
        await spInstance.setString(key, value);
        break;
      case 'int':
        await spInstance.setInt(key, value);
        break;
      case 'double':
        await spInstance.setDouble(key, value);
        break;
      case 'bool':
        await spInstance.setBool(key, value);
        break;
      default:
        success = false;
    }

    return success;
  }

  static dynamic getItem(String key) {
    return spInstance.get(key);
  }

  static bool hasItem(String key) {
    return spInstance.containsKey(key);
  }

  static Future<bool> removeItem(String key) async {
    if (spInstance.containsKey(key)) {
      await spInstance.remove(key);
      return true;
    }

    return false;
  }

  static Future<bool> clear() async {
    await spInstance.clear();
    return true;
  }

  static Set<String> getKeys() {
    return spInstance.getKeys();
  }
}