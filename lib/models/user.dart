import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable(nullable: false, explicitToJson: true)
class User {
  final String name;
  @JsonKey(name: 'garden_name')
  final String gardenName;

  User(this.name, this.gardenName);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
