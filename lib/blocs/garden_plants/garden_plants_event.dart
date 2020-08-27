part of 'garden_plants_bloc.dart';

abstract class GardenPlantsEvent extends Equatable {
  const GardenPlantsEvent();
}

class GetPlantsInUserGarden extends GardenPlantsEvent {
  @override
  List<Object> get props => [];
}
