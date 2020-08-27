import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fsoft_intern_mock_project/models/models.dart';
import 'package:fsoft_intern_mock_project/network/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'garden_plants_event.dart';
part 'garden_plants_state.dart';

class GardenPlantsBloc extends Bloc<GardenPlantsEvent, GardenPlantsState> {
  GardenPlantsBloc() : super(GardenPlantsInitial());

  final repository = Repository();

  @override
  Stream<GardenPlantsState> mapEventToState(
    GardenPlantsEvent event,
  ) async* {
    final pref = await SharedPreferences.getInstance();
    final username = pref.getString("username");
    if (event is GetPlantsInUserGarden) {
      try {
        yield GardenPlantsLoaded(await repository.getPlantsInUserGarden(username));
      } catch (e) {
        print(e);
        yield GardenPlantsNotLoaded();
      }
    }
  }
}
