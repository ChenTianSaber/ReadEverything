import 'package:work/generated/json/base/json_field.dart';
import 'package:work/generated/json/source_icon_entity.g.dart';
import 'dart:convert';
export 'package:work/generated/json/source_icon_entity.g.dart';

@JsonSerializable()
class SourceIconEntity {
	String? url;
	List<SourceIconIcons>? icons;

	SourceIconEntity();

	factory SourceIconEntity.fromJson(Map<String, dynamic> json) => $SourceIconEntityFromJson(json);

	Map<String, dynamic> toJson() => $SourceIconEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SourceIconIcons {
	String? url;
	int? width;
	int? height;
	String? format;
	int? bytes;
	dynamic error;
	String? sha1sum;

	SourceIconIcons();

	factory SourceIconIcons.fromJson(Map<String, dynamic> json) => $SourceIconIconsFromJson(json);

	Map<String, dynamic> toJson() => $SourceIconIconsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}