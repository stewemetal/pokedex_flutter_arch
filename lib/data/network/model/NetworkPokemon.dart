import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_arch/data/network/model/Ability.dart';
import 'package:pokedex_arch/data/network/model/Move.dart';
import 'package:pokedex_arch/data/network/model/NetworkPokemonType.dart';
import 'package:pokedex_arch/data/network/model/Sprites.dart';
import 'package:pokedex_arch/data/network/model/Stat.dart';

part 'NetworkPokemon.g.dart';

@JsonSerializable()
class NetworkPokemon {
  final int id;
  final String name;
  final int height;
  final int order;
  final int weight;
  final Sprites sprites;
  final List<Ability> abilities;
  final List<Move> moves;
  final List<Stat> stats;
  final List<NetworkPokemonType> types;

  NetworkPokemon({
    this.id,
    this.name,
    this.height,
    this.order,
    this.weight,
    this.sprites,
    this.abilities,
    this.moves,
    this.stats,
    this.types,
  });

  factory NetworkPokemon.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonToJson(this);
}
