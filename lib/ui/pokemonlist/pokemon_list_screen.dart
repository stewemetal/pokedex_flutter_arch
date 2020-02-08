import 'package:flutter/material.dart';
import 'package:pokedex_arch/di/pokemon_list_scope.dart';
import 'package:pokedex_arch/ui/pokemonlist/widgets/pokemon_container.dart';

class PokemonListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PokemonListScreenState();
}

class PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return PokemonListScope(
      injectionTarget: Scaffold(
        body: Stack(
          children: <Widget>[
            PokemonContainer(
              appBar: true,
            )
          ],
        ),
      ),
    );
  }
}
