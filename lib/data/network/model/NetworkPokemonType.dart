import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_arch/data/network/model/TypeX.dart';

part 'NetworkPokemonType.g.dart';

@JsonSerializable()
class NetworkPokemonType {
  final int slot;
  final TypeX type;

  NetworkPokemonType({this.slot, this.type});

  factory NetworkPokemonType.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonTypeToJson(this);
}
