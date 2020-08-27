part of 'water_the_tree_bloc.dart';

@immutable
abstract class WaterTheTreeEvent {}

class WaterTheTree extends WaterTheTreeEvent {
  final int plantId;
  final bool isWater;

  WaterTheTree(this.plantId, this.isWater) : assert(plantId != null);
}
