import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:pokedex_arch/domain/interactors/pokemon_list_interactor.dart';
import 'package:pokedex_arch/domain/model/pokemon.dart';
import 'package:pokedex_arch/ui/pokemonlist/bloc/pokemon_list_events.dart';
import 'package:pokedex_arch/ui/pokemonlist/bloc/pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  static const POKEMON_ITEM_STEP = 10;

  final PokemonListInteractor _interactor;

  List<Pokemon> _loadedPokemon = [];
  var loadedUntilIndex = 0;

  PokemonListBloc(this._interactor);

  @override
  PokemonListState get initialState => Loading();

  @override
  Stream<PokemonListState> mapEventToState(PokemonListEvent event) async* {
    try {
      if (event is LoadPokemonListEvent) {
        yield Loading();

        final newPokemon =
            await _interactor.getPokemon(POKEMON_ITEM_STEP, loadedUntilIndex);

        if (newPokemon == null) {
          yield Error();
          return;
        }
        if (newPokemon.length == 0) {
          yield Empty();
          return;
        }

        loadedUntilIndex += POKEMON_ITEM_STEP;
        // Do what you need with the data, resulting in _loadedPokemon
        _loadedPokemon.addAll(newPokemon);
        yield Content(pokemon: _loadedPokemon);
      }

      if (event is RefreshPokemonListEvent) {
        yield Refreshing();
        final newPokemon = await _interactor.getPokemon(loadedUntilIndex, 0);
        _loadedPokemon = newPokemon;
        yield Content(pokemon: _loadedPokemon);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'PokemonListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
