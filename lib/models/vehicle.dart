import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle extends Equatable {
  final String? name;
  final double? costInCredits;

  const Vehicle({
    required this.name,
    required this.costInCredits,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);


  @override
  List<Object?> get props => [name, costInCredits];
}
