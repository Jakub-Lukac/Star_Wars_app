part of 'vehicles_bloc.dart';

sealed class VehiclesEvent extends Equatable {
  const VehiclesEvent();

  @override
  List<Object> get props => [];
}

class LoadVehicles extends VehiclesEvent {
  final List<Vehicle> vehicles;

  const LoadVehicles({this.vehicles = const <Vehicle>[]});

  @override
  List<Object> get props => [vehicles];
}

class AddVehicle extends VehiclesEvent {
  final Vehicle vehicle;

  const AddVehicle(this.vehicle);

  @override
  List<Object> get props => [vehicle];
}
