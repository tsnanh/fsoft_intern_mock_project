import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fsoft_intern_mock_project/models/models.dart';
import 'package:fsoft_intern_mock_project/network/repository.dart';

part 'plant_list_event.dart';
part 'plant_list_state.dart';

class PlantListBloc extends Bloc<PlantListEvent, PlantListState> {
  final repository = Repository();
  PlantListBloc() : super(PlantListInitial());

  @override
  Stream<PlantListState> mapEventToState(
    PlantListEvent event,
  ) async* {
    try {
      yield PlantListLoaded(await repository.getListPlant());
    } catch (e) {
      print(e);
      yield PlantListNotLoaded(e);
    }
  }
}
