part of 'plant_list_bloc.dart';

abstract class PlantListState extends Equatable {
  const PlantListState();
}

class PlantListInitial extends PlantListState {
  @override
  List<Object> get props => [];
}

class PlantListLoaded extends PlantListState {
  final List<Plant> plants;

  const PlantListLoaded(this.plants) : assert(plants != null);
  @override
  List<Object> get props => [plants];

}

class PlantListNotLoaded extends PlantListState {
  final Exception exception;

  const PlantListNotLoaded(this.exception) : assert(exception != null);
  @override
  List<Object> get props => [exception];

}
