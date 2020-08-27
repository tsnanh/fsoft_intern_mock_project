import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fsoft_intern_mock_project/models/models.dart';
import 'package:fsoft_intern_mock_project/network/repository.dart';
import 'package:meta/meta.dart';

part 'water_the_tree_event.dart';

part 'water_the_tree_state.dart';

class WaterTheTreeBloc extends Bloc<WaterTheTreeEvent, WaterTheTreeState> {
  WaterTheTreeBloc() : super(WaterTheTreeInitial());

  final repository = Repository();

  @override
  Stream<WaterTheTreeState> mapEventToState(
    WaterTheTreeEvent event,
  ) async* {
    try {
      if (event is WaterTheTree) {
        yield WaterTheTreeSuccess(!event.isWater
            ? await repository.getSinglePlantInGarden(event.plantId)
            : await repository.waterTheTree(event.plantId));
      }
    } catch (e) {
      yield WaterTheTreeError();
    }
  }
}
