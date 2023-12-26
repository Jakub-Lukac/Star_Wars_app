import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/bloc/vehicles_bloc/vehicles_bloc.dart';
import 'package:star_wars_app/config/color_pallete.dart';

import '../widgets/item_card.dart';
import '../widgets/skeleton.dart';
import 'detail_screens/vehicle_detail_screen.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vehicles",
          style: TextStyle(
            color: colorPallete.textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorPallete.vehiclesColor,
      ),
      body: BlocBuilder<VehiclesBloc, VehiclesState>(
        builder: (context, state) {
          if (state is VehiclesLoading) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Skeleton();
              },
            );
          }

          if (state is VehiclesLoaded) {
            return ListView.builder(
              itemCount: state.vehicles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return VehicleDetailScreen(
                            vehicle: state.vehicles[index],
                          );
                        },
                      ),
                    );
                  },
                  child: ItemCard(
                    name: state.vehicles[index].name,
                    color: colorPallete.vehiclesColor,
                  ),
                );
              },
            );
          }
          if (state is VehiclesError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colorPallete.vehiclesColor,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
