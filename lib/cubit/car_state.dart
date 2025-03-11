import 'package:equatable/equatable.dart';

class CarState extends Equatable {
  final int currentLane;
  final int totalLanes;

  const CarState({
    required this.currentLane,
    required this.totalLanes,
  });

  factory CarState.initial() => const CarState(
    currentLane: 1,
    totalLanes: 3,
  );

  CarState copyWith({
    int? currentLane,
    int? totalLanes,
  }) {
    return CarState(
      currentLane: currentLane ?? this.currentLane,
      totalLanes: totalLanes ?? this.totalLanes,
    );
  }

  @override
  List<Object> get props => [currentLane, totalLanes];
}