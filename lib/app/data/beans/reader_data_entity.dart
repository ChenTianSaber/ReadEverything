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