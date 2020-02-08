import 'package:pokedex_arch/data/network/poke_api.dart';
import 'package:pokedex_arch/domain/model/pokemon.dart';
import 'package:pokedex_arch/domain/model/pokemon_type.dart';

class PokemonNetworkDataSource {
  final PokeApi _pokeApi;

  PokemonNetworkDataSource(this._pokeApi);

  Future<List<Pokemon>> getPokemon(int count, [int fromDexNumber]) async {
    final pokemonMetaResponse =
        await _pokeApi.getPokemonList(count, fromDexNumber);
    final networkPokemonMetaList = pokemonMetaResponse.body;

    final pokemonIds = networkPokemonMetaList.results.map((meta) {
      return int.parse(meta.url.split("/").last);
    }).toList();

    return Future.wait(
      pokemonIds.map((id) async {
        final networkPokemon = (await _pokeApi.getPokemon(id)).body;

        return Pokemon(
          id: networkPokemon.id,
          name: networkPokemon.name,
          height: networkPokemon.height,
          sprites: networkPokemon.sprites,
          abilities: networkPokemon.abilities,
          stats: networkPokemon.stats,
          types: networkPokemon.types
              .map(
                (type) => PokemonType(
                  slot: type.slot,
                  name: type.type.name,
                ),
              )
              .toList(growable: false),
        );
      }).toList(growable: false),
    );
  }
}
