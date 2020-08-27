import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsoft_intern_mock_project/blocs/plant_list/plant_list_bloc.dart';
import 'package:fsoft_intern_mock_project/components/plant_card.dart';

class PlantListScreen extends StatelessWidget {
  snackbar(String content) => SnackBar(content: Text(content));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PlantListBloc()..add(GetPlantList()),
        child: BlocBuilder<PlantListBloc, PlantListState>(
          builder: (context, state) {
            if (state is PlantListInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PlantListNotLoaded) {
//              Scaffold.of(context).showSnackBar(
//                  snackbar("Something went wrong. Please try again later!"));
            }
            if (state is PlantListLoaded) {
              return GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: state.plants.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.landscape)
                        ? 5
                        : 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1 / 1),
                itemBuilder: (context, index) {
                  return PlantCard(state.plants[index]);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
