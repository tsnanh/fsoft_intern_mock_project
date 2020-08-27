import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsoft_intern_mock_project/blocs/water_the_tree/water_the_tree_bloc.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';
import 'package:fsoft_intern_mock_project/utils/utils.dart';

class PlantInGardenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Styles.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.zero,
        ),
      ),
      child: BlocBuilder<WaterTheTreeBloc, WaterTheTreeState>(
        builder: (context, state) {
          if (state is WaterTheTreeInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WaterTheTreeSuccess) {
            final plant = state.plant;
            return Stack(
              children: [
                Column(
                  children: [
                    AspectRatio(
                      child: Image.network(
                        plant.image,
                        fit: BoxFit.cover,
                      ),
                      aspectRatio: 4 / 3,
                    ),
                    SizedBox(height: 8),
                    Text(
                      plant.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Planted",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      convertUnixTimestampToString(plant.datePlanted),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Last Watered",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${convertUnixTimestampToString(plant.lastWatered)} \nwater in '
                        '${calculateDayRemaining(plant.wateringCycle, plant.lastWatered)} day${calculateDayRemaining(plant.wateringCycle, plant.lastWatered) == 1 ? '' : 's'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.zero,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    heroTag: '${plant.id}',
                    child: Icon(
                      Icons.opacity,
                      color: Styles.primaryColor,
                    ),
                    onPressed: () {
                      BlocProvider.of<WaterTheTreeBloc>(context)
                          .add(WaterTheTree(plant.id, true));
                    },
                    tooltip: "Water",
                  ),
                ),
              ],
            );
          }
          if (state is WaterTheTreeError) {}
          return Container();
        },
      ),
    );
  }
}
