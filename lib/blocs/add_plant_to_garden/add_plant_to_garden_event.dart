part of 'add_plant_to_garden_bloc.dart';

@immutable
abstract class AddPlantToGardenEvent {
  final int plantId;

  AddPlantToGardenEvent(this.plantId)
      : assert(plantId != null);
}

class CheckHasPlant extends AddPlantToGardenEvent {
  CheckHasPlant(int plantId) : super(plantId);
}

class AddPlant extends AddPlantToGardenEvent {
  AddPlant(int plantId) : super(plantId);
}

class RemovePlant extends AddPlantToGardenEvent {
  RemovePlant(int plantId) : super(plantId);
}
