import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_app/models/vehicle.dart';

import '../../services/star_wars_service.dart';

part 'vehicles_event.dart';
part 'vehicles_state.dart';

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  VehiclesBloc() : super(VehiclesLoading()) {
    on<LoadVehicles>(_onLoadVehicles);
    on<AddVehicle>(_onAddVehicle);
  }

  void _onLoadVehicles(LoadVehicles event, Emitter<VehiclesState> emit) async {
    try {
      final dio = Dio();
      final starWarsService = StarWarsService(dio);
      final Map<String, dynamic> response = await starWarsService.getVehicles();

      final List<Vehicle> listOfVehicles = (response['results'] as List)
          .map((vehicleJson) => Vehicle.fromJson(vehicleJson))
          .toList();

      emit(
        VehiclesLoaded(vehicles: listOfVehicles),
      );
    } catch (e) {
      emit(
        const VehiclesError("Failed to load vehicles..."),
      );
    }
  }

  void _onAddVehicle(AddVehicle event, Emitter<VehiclesState> emit) {
    if (state is VehiclesLoaded) {
      final state = this.state as VehiclesLoaded;
      emit(
        VehiclesLoaded(
          vehicles: List.from(state.vehicles)..add(event.vehicle),
        ),
      );
    }
  }
}
