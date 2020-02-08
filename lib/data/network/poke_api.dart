import 'package:chopper/chopper.dart';
import 'package:pokedex_arch/data/network/model/NetworkPokemon.dart';
import 'package:pokedex_arch/data/network/model/NetworkPokemonList.dart';
import 'package:pokedex_arch/data/network/model/NetworkPokemonType.dart';

part 'poke_api.chopper.dart';

@ChopperApi(baseUrl: "/api/v2")
abstract class PokeApi extends ChopperService {
  static PokeApi create([ChopperClient client]) => _$PokeApi(client);

  @Get(path: "pokemon")
  Future<Response<NetworkPokemonList>> getPokemonList([
    @Query("limit") int limit = 20,
    @Query("offset") int offset = 0,
  ]);

  @Get(path: "pokemon/{id}")
  Future<Response<NetworkPokemon>> getPokemon(@Path("id") int id);

  @Get(path: "type/{name}")
  Future<Response<NetworkPokemonType>> getType({@Path("name") String name});
}
