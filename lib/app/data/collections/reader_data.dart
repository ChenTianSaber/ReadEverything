import 'package:isar/isar.dart';
import 'package:work/app/data/collections/source.dart';
import 'package:work/app/data/db/db_server.dart';
import 'package:work/app/modules/home/home.view.dart';

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

  /// 阅读状态，库/已读/收藏
  @Enumerated(EnumType.value, 'value')
  ListType? listType;

  /// 发布时间（用于排序）
  int? publishTime;

  /// 作者名字
  String? author;

  /// 关联源
  final source = IsarLink<Source>();
}
