import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsoft_intern_mock_project/blocs/garden_plants/garden_plants_bloc.dart';
import 'package:fsoft_intern_mock_project/blocs/water_the_tree/water_the_tree_bloc.dart';
import 'package:fsoft_intern_mock_project/components/plant_in_garden_card.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';

class GardenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GardenPlantsBloc()..add(GetPlantsInUserGarden()),
        child: BlocBuilder<GardenPlantsBloc, GardenPlantsState>(
          builder: (context, state) {
            if (state is GardenPlantsInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GardenPlantsNotLoaded) {
              // handle error
            }
            if (state is GardenPlantsLoaded) {
              print(state.plants);
              if (state.plants.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.local_florist,
                        color: Styles.primaryColor,
                        size: 120,
                      ),
                      Text("Your garden has no tree!",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Styles.primaryColor))
                    ],
                  ),
                );
              } else {
                return GridView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: state.plants.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 5
                          : 2,
                      childAspectRatio: 5 / 7.5),
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) => WaterTheTreeBloc()..add(WaterTheTree(state.plants[index].id, false)),
                        child: PlantInGardenCard());
                  },
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
