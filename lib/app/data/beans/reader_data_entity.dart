import 'package:work/app/data/collections/reader_data.dart';
import 'package:work/app/data/collections/source.dart';
import 'package:work/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:work/generated/json/reader_data_entity.g.dart';

@JsonSerializable()
class ReaderDataEntity {
  String? url;
  String? title;
  String? htmlContent;
  List<String>? images;
  List<String>? videos;
  int? publishTime;
  String? author;

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
      ..htmlContent = htmlContent
      ..author = author
      ..publishTime = publishTime
      ..images = images
      ..videos = videos
      ..source.value = source;
  }
}
