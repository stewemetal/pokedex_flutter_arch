import 'package:json_annotation/json_annotation.dart';

part 'Sprites.g.dart';

@JsonSerializable()
class Sprites {
  final String back_female;
  final String back_shiny_female;
  final String back_default;
  final String front_female;
  final String front_shiny_female;
  final String back_shiny;
  final String front_default;
  final String front_shiny;

  Sprites(
      {this.back_female,
      this.back_shiny_female,
      this.back_default,
      this.front_female,
      this.front_shiny_female,
      this.back_shiny,
      this.front_default,
      this.front_shiny});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
