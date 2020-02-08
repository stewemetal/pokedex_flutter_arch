import 'package:json_annotation/json_annotation.dart';

part 'NetworkPokemonList.g.dart';

@JsonSerializable()
class NetworkPokemonList {
  int count;
  String next;
  List<PokemonMetaResult> results;

  NetworkPokemonList({this.count, this.next, this.results});

  factory NetworkPokemonList.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonListToJson(this);
}

@JsonSerializable()
class PokemonMetaResult {
  String name;
  String url;

  PokemonMetaResult({this.name, this.url});

  factory PokemonMetaResult.fromJson(Map<String, dynamic> json) =>
      _$PokemonMetaResultFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMetaResultToJson(this);
}
