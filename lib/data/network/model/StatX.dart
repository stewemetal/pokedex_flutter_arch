import 'package:json_annotation/json_annotation.dart';

part 'StatX.g.dart';

@JsonSerializable()
class StatX {
  final String name;
  final String url;

  StatX({this.name, this.url});

  factory StatX.fromJson(Map<String, dynamic> json) => _$StatXFromJson(json);

  Map<String, dynamic> toJson() => _$StatXToJson(this);
}
