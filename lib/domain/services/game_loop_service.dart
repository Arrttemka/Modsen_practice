import 'dart:async';
import 'package:flutter/material.dart';
import '../../cubit/car_cubit.dart';
import '../../cubit/police_car_cubit.dart';
import '../../cubit/score_cubit.dart';

class GameLoopService {
  final CarCubit carCubit;
  final PoliceCarCubit policeCarCubit;
  final ScoreCubit scoreCubit;

  Timer? _timer;

  GameLoopService({
    required this.carCubit,
    required this.policeCarCubit,
    required this.scoreCubit,
  });

  void start() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (policeCarCubit.state.isCrashed) {
        stop();
        return;
      }

      if (timer.tick % 10 == 0) {
        policeCarCubit.spawnPoliceCar();
      }

      policeCarCubit.checkCollisions(carCubit.state.currentLane, 0.84);

      scoreCubit.incrementScore(1);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
  }
}