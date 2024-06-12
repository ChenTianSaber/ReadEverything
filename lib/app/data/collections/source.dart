import 'package:isar/isar.dart';
import 'package:work/app/data/db/db_server.dart';
import 'package:work/app/modules/home/home.view.dart';

part 'source.g.dart';

/// 信息源
@collection
class Source {
  Id get id => url == null ? Isar.autoIncrement : DBServer.fastHash(url!);

  /// 链接
  @Index(unique: true, replace: true, caseSensitive: false)
  String? url;

  /// 名称
  String? name;

  /// 图标
  String? icon;

  /// 解析规则，该规则用描述如何将 源 转换为 列表数据
  String? ruleCode;

  /// 解析规则的名字
  String? ruleName;

  /// 解析规则的url，如果设置的 url则会存在这个值，这样的话每次刷新的时候会先更新一下 url的规则
  String? ruleUrl;

  /// 上次更新的时间
  int? lastUpdateTime;

  /// 上次更新的结果
  @Enumerated(EnumType.value, 'value')
  LastUpdateType? updateResultType;

  /// 错误原因 (如果上次更新错误的话)
  String? updateErrorTip;

  /// 源站地址
  String? link;
}
