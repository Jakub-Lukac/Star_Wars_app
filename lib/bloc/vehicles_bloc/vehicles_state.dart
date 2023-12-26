part of 'vehicles_bloc.dart';

sealed class VehiclesState extends Equatable {
  const VehiclesState();
  
  @override
  List<Object> get props => [];
}

final class VehiclesLoading extends VehiclesState {}

final class VehiclesLoaded extends VehiclesState {
  final List<Vehicle> vehicles;

  const VehiclesLoaded({this.vehicles = const <Vehicle> []});

  @override
  List<Object> get props => [vehicles];
}

final class VehiclesError extends VehiclesState{
  final String errorMessage;

  const VehiclesError(this.errorMessage);

 @override
  List<Object> get props => [errorMessage];
}
