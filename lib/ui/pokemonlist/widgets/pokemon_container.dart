import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_arch/di/di_utils.dart';
import 'package:pokedex_arch/ui/pokemonlist/bloc/pokemon_list_bloc.dart';
import 'package:pokedex_arch/ui/pokemonlist/bloc/pokemon_list_events.dart';
import 'package:pokedex_arch/ui/pokemonlist/bloc/pokemon_list_state.dart';

class PokemonContainer extends StatelessWidget {
  final bool appBar;
  final Decoration decoration;
  final double height;

  const PokemonContainer({
    Key key,
    this.height,
    this.decoration,
    this.appBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final pokeSize = screenSize.width * 0.66;
    final pokeTop = -(screenSize.width * 0.154);
    final pokeRight = -(screenSize.width * 0.23);

    return Container(
      width: screenSize.width,
      decoration: decoration,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: pokeTop,
            right: pokeRight,
            child: Image.asset(
              "assets/images/pokeball.png",
              width: pokeSize,
              height: pokeSize,
              color: Color(0xFF303943).withOpacity(0.05),
            ),
          ),
          BlocBuilder<PokemonListBloc, PokemonListState>(
            builder: (context, snapshot) {
              if (snapshot is Content) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.pokemon.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.green,
                    child: Center(
                      child: Text("${snapshot.pokemon[index].name}"),
                    ),
                  ),
                );
              }

              if (snapshot is Loading) {
                context.getBloc<PokemonListBloc>().add(LoadPokemonListEvent());
                return Center(
                  child: Text("LOADING"),
                );
              }
              if (snapshot is Empty) {
                return Center(
                  child: Text("LOADING"),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
