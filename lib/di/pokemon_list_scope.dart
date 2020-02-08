import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_arch/domain/interactors/pokemon_list_interactor.dart';
import 'package:pokedex_arch/ui/pokemonlist/bloc/pokemon_list_bloc.dart';

import 'di_utils.dart';

class PokemonListScope extends Scope {
  PokemonListScope({@required Widget injectionTarget}) : super(injectionTarget);

  @override
  Widget buildDependencyTree({@required Widget injectionTarget}) {
    return MultiBlocProvider(
      providers: [
        _providePokemonListBloc(),
      ],
      child: injectionTarget,
    );
  }

  BlocProvider<PokemonListBloc> _providePokemonListBloc() {
    return BlocProvider<PokemonListBloc>(
      create: (context) {
        return PokemonListBloc(
          context.getElement<PokemonListInteractor>(),
        );
      },
    );
  }
}
