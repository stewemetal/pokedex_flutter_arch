import 'package:pokedex_arch/data/db/pokemon_disk_data_source.dart';
import 'package:pokedex_arch/data/network/pokemon_network_data_source.dart';
import 'package:pokedex_arch/domain/model/pokemon.dart';

class PokemonListInteractor {
  static const MAX_DEX_NUMBER = 890;

  final PokemonNetworkDataSource _networkDataSource;
  final PokemonDiskDataSource _diskDataSource;

  PokemonListInteractor(this._networkDataSource, this._diskDataSource);

  Future<List<Pokemon>> getPokemon(int count, [int fromDexNumber]) async {
    final requestedMaxDexNumber = fromDexNumber + count;
    final correctedCount = requestedMaxDexNumber > MAX_DEX_NUMBER
        ? count - (requestedMaxDexNumber - MAX_DEX_NUMBER)
        : count;
    var pokemonFromDb =
        await _diskDataSource.getPokemon(correctedCount, fromDexNumber);
    if (pokemonFromDb.length < correctedCount) {
      try {
        final networkPokemon =
            await _networkDataSource.getPokemon(correctedCount, fromDexNumber);
        await _diskDataSource.insertPokemon(networkPokemon);
        pokemonFromDb =
            await _diskDataSource.getPokemon(correctedCount, fromDexNumber);
      } catch (err) {
        return pokemonFromDb;
      }
    }
    return pokemonFromDb;
  }
}
