import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/collections/source.dart';
import 'package:work/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:work/generated/json/reader_data_entity.g.dart';

@JsonSerializable()
class ReaderDataEntity {
  String? url;
  String? title;
  String? desc;
  String? markdown;
  String? html;
  List<String>? images;
  List<String>? videos;

  ReaderDataEntity();

  factory ReaderDataEntity.fromJson(Map<String, dynamic> json) => $ReaderDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $ReaderDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

extension ReaderDataEntityEX on ReaderDataEntity {
  ReaderData toReaderData(Source source) {
    return ReaderData()
      ..url = url
      ..title = title
      ..desc = desc
      ..markdown = markdown
      ..html = html
      ..images = images
      ..videos = videos
      ..source.value = source;
  }
}
