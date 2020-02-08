import 'package:moor/moor.dart';
import 'package:pokedex_arch/data/db/model/database_pokemon.dart';
import 'package:pokedex_arch/data/db/pokedex_database.dart';

part 'pokemon_dao.g.dart';

@UseDao(tables: [DatabasePokemon])
class PokemonDao extends DatabaseAccessor<PokedexDatabase>
    with _$PokemonDaoMixin {
  PokemonDao(PokedexDatabase db) : super(db);

  Future<List<DatabasePokemonData>> getPokemon({
    @required int count,
    @required int fromDexNumber,
  }) async {
    return (select(databasePokemon)
          ..where((entity) => entity.id.isBetweenValues(
                fromDexNumber,
                fromDexNumber + count,
              )))
        .get();
  }

  // Queries

  Future insertPokemon(List<DatabasePokemonData> pokemonList) async {
    await batch((batch) {
      batch.insertAll(
        databasePokemon,
        pokemonList
            .map((p) => DatabasePokemonCompanion.insert(
                  id: p.id,
                  name: p.name,
                  height: p.height,
                  weight: p.weight,
                  sprites: p.sprites,
                ))
            .toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}
