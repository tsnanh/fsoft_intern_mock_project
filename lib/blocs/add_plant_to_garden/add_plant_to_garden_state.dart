part of 'add_plant_to_garden_bloc.dart';

@immutable
abstract class AddPlantToGardenState {}

class AddPlantToGardenInitial extends AddPlantToGardenState {}

class PlantInGarden extends AddPlantToGardenState {}

class PlantNotInGarden extends AddPlantToGardenState {}

class AddOrRemovePlantError extends AddPlantToGardenState {}
