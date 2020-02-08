import 'package:json_annotation/json_annotation.dart';

part 'AbilityX.g.dart';

@JsonSerializable()
class AbilityX {
  final String name;
  final String url;

  AbilityX({this.name, this.url});

  factory AbilityX.fromJson(Map<String, dynamic> json) =>
      _$AbilityXFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityXToJson(this);
}
