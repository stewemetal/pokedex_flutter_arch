import 'package:json_annotation/json_annotation.dart';

part 'MoveX.g.dart';

@JsonSerializable()
class MoveX {
  final String name;
  final String url;

  MoveX({this.name, this.url});

  factory MoveX.fromJson(Map<String, dynamic> json) => _$MoveXFromJson(json);

  Map<String, dynamic> toJson() => _$MoveXToJson(this);
}
