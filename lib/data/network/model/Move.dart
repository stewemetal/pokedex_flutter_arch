import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_arch/data/network/model/MoveX.dart';

part 'Move.g.dart';

@JsonSerializable()
class Move {
  final MoveX move;

  Move({this.move});

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}
