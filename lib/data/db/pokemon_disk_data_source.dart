import 'dart:convert';

import 'package:pokedex_arch/data/db/dao/pokemon_dao.dart';
import 'package:pokedex_arch/data/db/pokedex_database.dart';
import 'package:pokedex_arch/domain/model/pokemon.dart';

class PokemonDiskDataSource {
  final PokemonDao _pokemonDao;

  PokemonDiskDataSource(this._pokemonDao);

  Future<List<Pokemon>> getPokemon(int count, [int fromDexNumber = 0]) async {
    try {
      final pokemonFromDb = await _pokemonDao.getPokemon(
          count: count, fromDexNumber: fromDexNumber);
      return pokemonFromDb
          .map((p) => Pokemon(
                id: p.id,
                name: p.name,
                height: p.height,
                weight: p.weight,
                sprites: json.decode(p.sprites),
                abilities: null,
                stats: null,
                types: null,
              ))
          .toList(growable: false);
    } catch (err) {
      return null;
    }
  }

  Future insertPokemon(List<Pokemon> pokemonList) async {
    await _pokemonDao.insertPokemon(
      pokemonList
          .map((p) => DatabasePokemonData(
                id: p.id,
                name: p.name,
                height: p.height,
                weight: p.weight,
                sprites: json.encode(p.sprites),
              ))
          .toList(),
    );
  }
}
