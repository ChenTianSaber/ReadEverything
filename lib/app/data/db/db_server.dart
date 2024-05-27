import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/collections/source.dart';

class DBServer{
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
}