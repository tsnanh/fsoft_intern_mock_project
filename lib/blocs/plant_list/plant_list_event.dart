part of 'plant_list_bloc.dart';

abstract class PlantListEvent extends Equatable {
  const PlantListEvent();
}

class GetPlantList extends PlantListEvent {
  @override
  List<Object> get props => [];
}
