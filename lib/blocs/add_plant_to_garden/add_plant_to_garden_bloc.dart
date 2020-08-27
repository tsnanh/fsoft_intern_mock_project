import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fsoft_intern_mock_project/network/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_plant_to_garden_event.dart';

part 'add_plant_to_garden_state.dart';

class AddPlantToGardenBloc
    extends Bloc<AddPlantToGardenEvent, AddPlantToGardenState> {
  AddPlantToGardenBloc() : super(AddPlantToGardenInitial());

  final repository = Repository();

  @override
  Stream<AddPlantToGardenState> mapEventToState(
    AddPlantToGardenEvent event,
  ) async* {
    final pref = await SharedPreferences.getInstance();
    final username = pref.getString("username");
    try {
      if (event is CheckHasPlant) {
        yield await repository.checkIfGardenHasPlant(username, event.plantId)
            ? PlantInGarden()
            : PlantNotInGarden();
      }
      if (event is AddPlant) {
        yield await repository.addPlantToGarden(username, event.plantId)
            ? PlantInGarden()
            : PlantNotInGarden();
      }
      if (event is RemovePlant) {
        yield await repository.removePlantFromGarden(
                username, event.plantId)
            ? PlantNotInGarden()
            : PlantInGarden();
      }
    } catch (e) {
      yield AddOrRemovePlantError();
    }
  }
}
