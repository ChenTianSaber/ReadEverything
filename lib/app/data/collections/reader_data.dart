import 'package:isar/isar.dart';
import 'package:work/app/data/collections/source.dart';

part 'reader_data.g.dart';

/// 信息源
@collection
class ReaderData {
  Id id = Isar.autoIncrement;

  /// 标题
  String? title;

  /// 描述
  String? desc;

  /// markdown
  String? markdown;

  /// 本地html
  String? html;

  /// 图片列表
  List<String>? images;

  /// 视频列表
  List<String>? videos;

  /// 原文地址url
  String? url;

  /// 关联源
  final source = IsarLink<Source>();
}
