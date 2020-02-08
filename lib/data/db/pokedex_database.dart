import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:pokedex_arch/data/db/dao/pokemon_dao.dart';
import 'package:pokedex_arch/data/db/model/database_pokemon.dart';

part 'pokedex_database.g.dart';

@UseMoor(tables: [
  DatabasePokemon,
], daos: [
  PokemonDao,
])
class PokedexDatabase extends _$PokedexDatabase {
  PokedexDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'pokedex.db',
            logStatements: false,
          ),
        );

  @override
  int get schemaVersion => 1;
}
