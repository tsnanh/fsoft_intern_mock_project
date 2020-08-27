import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsoft_intern_mock_project/blocs/add_plant_to_garden/add_plant_to_garden_bloc.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';
import 'package:fsoft_intern_mock_project/models/models.dart';

class PlantDetailScreen extends StatelessWidget {
  final Plant plant;

  const PlantDetailScreen(this.plant) : assert(plant != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                plant.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 192.0),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * (2 / 3),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.zero,
                      ),
                    ),
                    elevation: 8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(plant.name, style: Styles.headline2),
                                BlocProvider(
                                  create: (context) => AddPlantToGardenBloc()
                                    ..add(CheckHasPlant(plant.id)),
                                  child: BlocBuilder<AddPlantToGardenBloc,
                                      AddPlantToGardenState>(
                                    builder: (context, state) {
                                      if (state is AddPlantToGardenInitial) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      bool isNotInGardenState =
                                          state is PlantNotInGarden;
                                      return FloatingActionButton.extended(
                                        icon: isNotInGardenState
                                            ? Icon(Icons.add)
                                            : Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          BlocProvider.of<AddPlantToGardenBloc>(
                                                  context)
                                              .add(isNotInGardenState
                                                  ? AddPlant(plant.id)
                                                  : RemovePlant(plant.id));
                                        },
                                        backgroundColor: isNotInGardenState
                                            ? Styles.primaryColor
                                            : Colors.grey,
                                        label: Text(isNotInGardenState
                                            ? "ADD TO GARDEN"
                                            : "REMOVE FROM GARDEN"),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.zero,
                                            topRight: Radius.circular(24),
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.zero,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 64.0),
                            child: Text(
                              '"${plant.quote}"',
                              style: Styles.headline6.copyWith(
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(plant.description, style: Styles.headline5)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Card(
              margin: EdgeInsets.zero,
              color: Styles.primaryColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.zero,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.navigate_before, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
