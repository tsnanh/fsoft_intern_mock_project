// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plant _$PlantFromJson(Map<String, dynamic> json) {
  return Plant(
    json['id'] as int,
    json['name'] as String,
    json['quote'] as String,
    json['description'] as String,
    json['image'] as String,
    json['watering_cycle'] as int,
    json['record_id'] as int,
    json['date_planted'] as int,
    json['last_watered'] as int,
    json['user'] as String,
  );
}

Map<String, dynamic> _$PlantToJson(Plant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quote': instance.quote,
      'description': instance.description,
      'image': instance.image,
      'record_id': instance.recordId,
      'watering_cycle': instance.wateringCycle,
      'date_planted': instance.datePlanted,
      'last_watered': instance.lastWatered,
      'user': instance.user,
    };
