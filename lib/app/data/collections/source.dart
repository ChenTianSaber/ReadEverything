import 'package:isar/isar.dart';

part 'source.g.dart';

/// 信息源
@collection
class Source {
  Id id = Isar.autoIncrement;

  /// 链接
  @Index(unique: true, replace: true, caseSensitive: false)
  String? url;

  /// 名称
  String? name;

  /// 图标
  String? icon;

  /// 解析规则，该规则用描述如何将 源 转换为 列表数据
  String? generateReaderDataCode;
}
