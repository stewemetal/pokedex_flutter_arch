import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex_arch/data/network/model/Ability.dart';
import 'package:pokedex_arch/data/network/model/Sprites.dart';
import 'package:pokedex_arch/data/network/model/Stat.dart';
import 'package:pokedex_arch/domain/model/pokemon_type.dart';

@immutable
class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final Sprites sprites;
  final List<Ability> abilities;
  final List<Stat> stats;
  final List<PokemonType> types;

  Pokemon(
      {this.id,
      this.name,
      this.height,
      this.weight,
      this.sprites,
      this.abilities,
      this.stats,
      this.types});

  @override
  List<Object> get props => [
        id,
        name,
        height,
        weight,
        sprites,
        abilities,
        stats,
        types,
      ];
}
