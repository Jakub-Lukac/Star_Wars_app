import 'package:flutter/material.dart';
import 'package:star_wars_app/config/color_pallete.dart';
import 'package:star_wars_app/models/vehicle.dart';


class VehicleDetailScreen extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleDetailScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPallete.vehiclesColor,
        title: Text(
          vehicle.name!,
          style: TextStyle(
            fontSize: 30,
            color: colorPallete.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vehicle.name!,
              style: TextStyle(
                color: colorPallete.vehiclesColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              vehicle.costInCredits.toString(),
              style: TextStyle(
                color: colorPallete.vehiclesColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
