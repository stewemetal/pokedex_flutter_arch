import 'package:flutter/material.dart';
import 'package:pokedex_arch/di/singleton_scope.dart';
import 'package:pokedex_arch/routing/routing.gr.dart';

enum BuildType { DEV, MOCK }

class PokedexApp extends StatelessWidget {
  final BuildType buildType;

  PokedexApp.dev() : buildType = BuildType.DEV;

  PokedexApp.mock() : buildType = BuildType.MOCK;

  @override
  Widget build(BuildContext context) {
    switch (buildType) {
      case BuildType.DEV:
        return SingletonScope(
          injectionTarget: _buildApp(),
        );
      case BuildType.MOCK:
        return MockSingletonScope(
          injectionTarget: _buildApp(),
        );
      default:
        throw StateError("App was started in an unsupported mode: $buildType");
    }
  }
}

MaterialApp _buildApp() {
  return MaterialApp(
    title: 'Pokedex',
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    initialRoute: Router.pokemonListScreenRoute,
    onGenerateRoute: Router.onGenerateRoute,
  );
}
