import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant.g.dart';

@immutable
@JsonSerializable(explicitToJson: true, nullable: false)
class Plant {
  final int id;
  final String name;
  final String quote;
  final String description;
  final String image;
  @JsonKey(name: 'record_id')
  final int recordId;
  @JsonKey(name: 'watering_cycle')
  final int wateringCycle;
  @JsonKey(name: 'date_planted')
  final int datePlanted;
  @JsonKey(name: 'last_watered')
  final int lastWatered;
  final String user;

  Plant(this.id, this.name, this.quote, this.description, this.image,
      this.wateringCycle, this.recordId, this.datePlanted, this.lastWatered, this.user);

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);

  Map<String, dynamic> toJson() => _$PlantToJson(this);
}
