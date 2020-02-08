import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_arch/data/network/model/StatX.dart';

part 'Stat.g.dart';

@JsonSerializable()
class Stat {
  final int base_stat;
  final int effort;
  final StatX stat;

  Stat({this.base_stat, this.effort, this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}
