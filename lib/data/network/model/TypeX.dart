import 'package:json_annotation/json_annotation.dart';

part 'TypeX.g.dart';

@JsonSerializable()
class TypeX {
  final String name;
  final String url;

  TypeX({this.name, this.url});

  factory TypeX.fromJson(Map<String, dynamic> json) => _$TypeXFromJson(json);

  Map<String, dynamic> toJson() => _$TypeXToJson(this);
}
