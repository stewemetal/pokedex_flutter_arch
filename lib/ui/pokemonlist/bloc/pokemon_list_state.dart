library pokemon_list_state;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_arch/domain/model/pokemon.dart';

@immutable
abstract class PokemonListState {
  const PokemonListState();
}

class Loading extends PokemonListState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

class Refreshing extends PokemonListState {
  static final Refreshing _instance = Refreshing._();

  factory Refreshing() => _instance;

  Refreshing._();
}

class Content extends PokemonListState with EquatableMixin {
  final List<Pokemon> pokemon;

  Content({@required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}

class Empty extends PokemonListState {
  static final Empty _instance = Empty._();

  factory Empty() => _instance;

  Empty._();
}

class Error extends PokemonListState {
  static final Error _instance = Error._();

  factory Error() => _instance;

  Error._();
}
