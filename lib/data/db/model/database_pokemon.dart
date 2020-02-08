import 'package:moor/moor.dart';

@DataClassName("DatabasePokemonData")
class DatabasePokemon extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  IntColumn get height => integer()();

  IntColumn get weight => integer()();

  TextColumn get sprites => text()();

  @override
  Set<Column> get primaryKey => {id};

//  List<Ability> abilities;
//  List<Move> moves;
//  List<Stat> stats;
//  List<PokemonType> types;
}
