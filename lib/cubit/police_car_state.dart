import 'package:equatable/equatable.dart';
import '../domain/entities/police_car.dart';

class PoliceCarState extends Equatable {
  final List<PoliceCar> policeCars;
  final bool isCrashed;

  const PoliceCarState({
    required this.policeCars,
    required this.isCrashed,
  });

  factory PoliceCarState.initial() => const PoliceCarState(
    policeCars: [],
    isCrashed: false,
  );

  PoliceCarState copyWith({
    List<PoliceCar>? policeCars,
    bool? isCrashed,
  }) {
    return PoliceCarState(
      policeCars: policeCars ?? this.policeCars,
      isCrashed: isCrashed ?? this.isCrashed,
    );
  }

  @override
  List<Object> get props => [policeCars, isCrashed];
}