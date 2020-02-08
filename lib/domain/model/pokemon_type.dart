import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type.g.dart';

@immutable
@JsonSerializable()
class PokemonType extends Equatable {
  final int slot;
  final String name;

  PokemonType({this.slot, this.name});

  @override
  List<Object> get props => [slot, name];

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
