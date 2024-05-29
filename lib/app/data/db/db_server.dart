import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/collections/source.dart';

class DBServer {
  factory DBServer() => _instance;
  static final DBServer _instance = DBServer._internal();

  DBServer._internal();

  Isar? _isar;

  Isar get isar {
    assert(_isar != null, "DBServer.load('<Userid>');");

    return _isar!;
  }

  /// 加载db
  Future<bool> load() async {
    await _close();

    final dir = await getApplicationDocumentsDirectory();

    DBServer()._isar = await Isar.open(
      [SourceSchema, ReaderDataSchema],
      directory: dir.path,
    );

    return true;
  }

  /// 关闭数据库
  Future<bool> _close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
    }

    return true;
  }

  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}

extension DBServerHelp on DBServer {
  /// 查
  Future<List<T>?> getAll<T>() async {
    try {
      return await isar.collection<T>().where().findAll();
    } catch (e) {
      log(e.toString(), name: "isarError");
      return null;
    }
  }

  /// 通过 url 获取 items
  Future<T?> getFromUrl<T>(String url) async {
    try {
      return await isar.collection<T>().get(DBServer.fastHash(url));
    } catch (e) {
      log(e.toString(), name: "isarError");
      return null;
    }
  }

  /// 增 - 存在就替换.不存在就执行插入
  Future<bool> inserts<T>(List<T> items) async {
    try {
      List<Id> result = [];
      await isar.writeTxn(() async {
        result.addAll(await isar.collection<T>().putAll(items));
      });
      return result.isNotEmpty;
    } catch (e) {
      log(e.toString(), name: "isarError");
      return false;
    }
  }

  /// 修改
  /// [keyId] 根据keyId 获取 db 的item
  /// [updateBuilder] 修改器.会将db 返回的item
  Future<bool> update<T>({required String url, Function(T dbItem)? updateBuilder}) async {
    try {
      T? item = await getFromUrl<T>(url);
      if (item != null && updateBuilder != null) {
        await updateBuilder(item);
        Id? result;
        await isar.writeTxn(() async {
          result = await isar.collection<T>().put(item);
        });
        return result != null;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: "isarError");
      return false;
    }
  }

  /// 删
  Future<bool> deletes<T>(List<String> urls) async {
    try {
      List<Id> deletes = [];
      await isar.writeTxn(() async {
        for (var url in urls) {
          Id id = DBServer.fastHash(url);
          bool isDelete = await isar.collection<T>().delete(id);
          if (isDelete) {
            deletes.add(id);
          }
        }
      });
      return urls.length == deletes.length;
    } catch (e) {
      log(e.toString(), name: "isarError");
      return false;
    }
  }
}

class DBServerSource {
  /// 获取全部
  static Future<List<Source>> getAll() async {
    List<Source> sources = (await DBServer().getAll<Source>()) ?? [];
    return sources;
  }

  /// 查找
  static Future<Source?> getSourceFromUrl(String url) async {
    return await DBServer().getFromUrl<Source>(url);
  }

  /// 插入
  static Future<bool> inserts(List<Source> sources) async {
    return await DBServer().inserts<Source>(sources..removeWhere((element) => element.url == null));
  }

  /// 改
  static Future<bool> update({required String url, required Function(Source dbItem) updateBuilder}) async {
    return await DBServer().update<Source>(url: url, updateBuilder: updateBuilder);
  }

  /// 删除
  static Future<bool> delete(String url) async {
    return await DBServer().deletes<Source>([url]);
  }
}

class DBServerReaderData {
  /// 获取全部
  static Future<List<ReaderData>> getAll() async {
    List<ReaderData> data = (await DBServer().getAll<ReaderData>()) ?? [];
    return data;
  }

  /// 查找
  static Future<ReaderData?> getSourceFromUrl(String url) async {
    return await DBServer().getFromUrl<ReaderData>(url);
  }

  /// 插入
  static Future<bool> inserts(List<ReaderData> values) async {
    return await DBServer().inserts<ReaderData>(values..removeWhere((element) => element.url == null));
  }

  /// 改
  static Future<bool> update({required String url, required Function(ReaderData dbItem) updateBuilder}) async {
    return await DBServer().update<ReaderData>(url: url, updateBuilder: updateBuilder);
  }

  /// 删除
  static Future<bool> delete(String url) async {
    return await DBServer().deletes<ReaderData>([url]);
  }
}
