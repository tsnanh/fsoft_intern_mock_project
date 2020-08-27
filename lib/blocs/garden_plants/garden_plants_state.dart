part of 'garden_plants_bloc.dart';

abstract class GardenPlantsState extends Equatable {
  const GardenPlantsState();
}

class GardenPlantsInitial extends GardenPlantsState {
  @override
  List<Object> get props => [];
}

class GardenPlantsLoaded extends GardenPlantsState {
  final List<Plant> plants;

  const GardenPlantsLoaded(this.plants);

  @override
  List<Object> get props => [plants];
}

class GardenPlantsNotLoaded extends GardenPlantsState {

  @override
  List<Object> get props => [];
}
