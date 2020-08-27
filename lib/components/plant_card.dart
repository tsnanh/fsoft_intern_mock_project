import 'package:flutter/material.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';
import 'package:fsoft_intern_mock_project/models/models.dart';
import 'package:fsoft_intern_mock_project/screens/plant_detail_screen.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard(this.plant) : assert(plant != null);

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
        ),),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlantDetailScreen(plant),
        )),
        child: Column(
          children: [
            AspectRatio(
              child: Ink.image(
                image: Image.network(
                  plant.image,
                ).image,
                fit: BoxFit.cover,
              ),
              aspectRatio: 4 / 3,
            ),
            Expanded(
              child: Center(
                child: Text(
                  plant.name,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
