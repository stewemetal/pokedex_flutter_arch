import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_arch/data/network/model/AbilityX.dart';

part 'Ability.g.dart';

@JsonSerializable()
class Ability {
  final bool is_hidden;
  final int slot;
  final AbilityX ability;

  Ability({this.is_hidden, this.slot, this.ability});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}
