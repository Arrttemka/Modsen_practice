import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarState.initial());

  void moveLeft() {
    if (state.currentLane > 0) {
      emit(state.copyWith(currentLane: state.currentLane - 1));
    }
  }

  void moveRight() {
    if (state.currentLane < state.totalLanes - 1) {
      emit(state.copyWith(currentLane: state.currentLane + 1));
    }
  }

  void resetLane() {
    emit(CarState.initial());
  }
}