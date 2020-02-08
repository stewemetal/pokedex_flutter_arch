import 'package:flutter/foundation.dart';

@immutable
abstract class PokemonListEvent {
  const PokemonListEvent();
}

class LoadPokemonListEvent extends PokemonListEvent {
  static final LoadPokemonListEvent _instance = LoadPokemonListEvent._();

  factory LoadPokemonListEvent() => _instance;

  LoadPokemonListEvent._();
}

class RefreshPokemonListEvent extends PokemonListEvent {
  static final RefreshPokemonListEvent _instance = RefreshPokemonListEvent._();

  factory RefreshPokemonListEvent() => _instance;

  RefreshPokemonListEvent._();
}
