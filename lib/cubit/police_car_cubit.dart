import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/entities/police_car.dart';
import 'police_car_state.dart';

class PoliceCarCubit extends Cubit<PoliceCarState> {
  final Random _random = Random();
  AnimationController? _controller;
  List<double> availableLanes = [0.15, 0.4, 0.65];

  BuildContext? _context;

  PoliceCarCubit() : super(PoliceCarState.initial());

  void initialize(TickerProvider vsync, {BuildContext? context}) {
    _context = context;

    if (_controller != null) {
      _controller!.removeListener(_updatePositions);
      _controller!.stop();
      _controller!.dispose();
      _controller = null;
    }

    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _controller!.addListener(_updatePositions);
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  void _updatePositions() {
    if (state.isCrashed) return;

    const double step = 0.005;
    List<PoliceCar> updatedCars = [];

    for (var car in state.policeCars) {
      updatedCars.add(PoliceCar(
        lane: car.lane,
        top: car.top + step,
      ));
    }

    updatedCars.removeWhere((car) => car.top > 1.2);

    emit(state.copyWith(policeCars: updatedCars));
  }

  void spawnPoliceCar() {
    if (state.isCrashed) return;

    double lane = availableLanes[_random.nextInt(availableLanes.length)];
    double top = -0.6;

    if (!state.policeCars.any((car) => car.lane == lane && (car.top - top).abs() < 0.5)) {
      final List<PoliceCar> updatedCars = List.from(state.policeCars);
      updatedCars.add(PoliceCar(lane: lane, top: top));
      emit(state.copyWith(policeCars: updatedCars));
    }
  }

  void checkCollisions(int playerLane, double playerTop) {
    if (state.isCrashed) return;

    double playerHeight = 0.1;
    double playerLanePosition = availableLanes[playerLane];

    for (var car in state.policeCars) {
      if (car.lane == playerLanePosition) {
        double carTop = car.top;
        double carHeight = 0.1;
        if (carTop + carHeight > playerTop && carTop < playerTop + playerHeight) {
          onCrash();
          break;
        }
      }
    }
  }

  void onCrash() {
    _controller?.stop();
    emit(state.copyWith(isCrashed: true));

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_context != null) {
        Navigator.of(_context!).pushReplacementNamed('/game_over');
      }
    });
  }

  void resetGame() {
    _controller?.removeListener(_updatePositions);
    _controller?.stop();
    _controller?.dispose();
    _controller = null;

    emit(PoliceCarState.initial());
  }

  @override
  Future<void> close() {
    _controller?.removeListener(_updatePositions);
    _controller?.stop();
    _controller?.dispose();
    _controller = null;
    _context = null;
    return super.close();
  }
}