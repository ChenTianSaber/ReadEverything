import 'package:isar/isar.dart';
import 'package:work/app/data/collections/source.dart';
import 'package:work/app/data/db/db_server.dart';

part 'reader_data.g.dart';

/// 信息源
@collection
class ReaderData {
  Id get id => url == null ? Isar.autoIncrement : DBServer.fastHash(url!);

  /// 原文地址url
  /// @required
  String? url;

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

  /// 关联源
  final source = IsarLink<Source>();
}
