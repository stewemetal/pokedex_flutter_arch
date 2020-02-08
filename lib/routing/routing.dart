import 'package:auto_route/auto_route_annotations.dart';
import 'package:pokedex_arch/ui/pokemondetails/pokemon_details_screen.dart';
import 'package:pokedex_arch/ui/pokemonlist/pokemon_list_screen.dart';

@AutoRouter()
class $Router {
  @initial
  PokemonListScreen pokemonListScreenRoute;

  PokemonDetailsScreen pokemonDetailsScreenRoute;
}
