part of 'water_the_tree_bloc.dart';

@immutable
abstract class WaterTheTreeState {}


class WaterTheTreeInitial extends WaterTheTreeState {}

class WaterTheTreeSuccess extends WaterTheTreeState {
  final Plant plant;

  WaterTheTreeSuccess(this.plant) : assert(plant != null);
}

class WaterTheTreeError extends WaterTheTreeState {}
