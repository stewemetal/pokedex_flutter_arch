import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_arch/data/db/dao/pokemon_dao.dart';
import 'package:pokedex_arch/data/db/pokedex_database.dart';
import 'package:pokedex_arch/data/db/pokemon_disk_data_source.dart';
import 'package:pokedex_arch/data/network/poke_api.dart';
import 'package:pokedex_arch/data/network/pokemon_network_data_source.dart';
import 'package:pokedex_arch/di/di_utils.dart';
import 'package:pokedex_arch/domain/interactors/pokemon_list_interactor.dart';
import 'package:provider/provider.dart';

class SingletonScope extends Scope {
  SingletonScope({@required Widget injectionTarget}) : super(injectionTarget);

  @override
  Widget buildDependencyTree({@required Widget injectionTarget}) {
    return MultiProvider(
      providers: [
        _provideChopperClient(),
        _providePokeApi(),
        _providePokemonNetworkDataSource(),
        _providePokedexDatabase(),
        _providePokemonDao(),
        _providePokemonDiskDataSource(),
        _providePokemonListInteractor(),
      ],
      child: injectionTarget,
    );
  }
}

Provider<ChopperClient> _provideChopperClient() {
  return Provider<ChopperClient>(
    create: (context) {
      return ChopperClient(
        baseUrl: "https://pokeapi.co",
        services: [
          PokeApi.create(),
        ],
        converter: JsonConverter(),
      );
    },
    dispose: (context, value) => value.dispose(),
  );
}

Provider<PokeApi> _providePokeApi() {
  return Provider<PokeApi>(
    create: (context) {
      final chopper = context.getElement<ChopperClient>();
      return PokeApi.create(chopper);
    },
    dispose: (_, value) => value.dispose(),
  );
}

Provider<PokemonNetworkDataSource> _providePokemonNetworkDataSource() {
  return Provider<PokemonNetworkDataSource>(
    create: (context) {
      return PokemonNetworkDataSource(
        context.getElement<PokeApi>(),
      );
    },
  );
}

Provider<PokedexDatabase> _providePokedexDatabase() {
  return Provider<PokedexDatabase>(
    create: (context) => PokedexDatabase(),
    dispose: (_, value) => value.close(),
  );
}

Provider<PokemonDao> _providePokemonDao() {
  return Provider<PokemonDao>(
    create: (context) => PokemonDao(context.getElement<PokedexDatabase>()),
  );
}

Provider<PokemonDiskDataSource> _providePokemonDiskDataSource() {
  return Provider<PokemonDiskDataSource>(
    create: (context) =>
        PokemonDiskDataSource(context.getElement<PokemonDao>()),
  );
}

Provider<PokemonListInteractor> _providePokemonListInteractor() {
  return Provider<PokemonListInteractor>(
    create: (context) {
      return PokemonListInteractor(
        context.getElement<PokemonNetworkDataSource>(),
        context.getElement<PokemonDiskDataSource>(),
      );
    },
  );
}

class MockSingletonScope extends Scope {
  MockSingletonScope({@required Widget injectionTarget})
      : super(injectionTarget);

  @override
  Widget buildDependencyTree({Widget injectionTarget}) {
    // TODO: implement buildDependencyTree
    return null;
  }
}
