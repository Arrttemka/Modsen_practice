import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PoliceCarController extends GetxController with GetTickerProviderStateMixin {
  final int totalLanes = 3;
  var policeCars = <Map<String, dynamic>>[].obs;
  final Random _random = Random();

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();

    animation = Tween<double>(begin: 1, end: 0).animate(controller)
      ..addListener(() {
        updatePositions();
      });
  }

  void spawnPoliceCar() {
    List<double> availableLanes = [0.15, 0.4, 0.65];
    List<double> chosenLanes = [];

    while (chosenLanes.length < 2) {
      double lane = availableLanes[_random.nextInt(availableLanes.length)];
      if (!chosenLanes.contains(lane)) {
        chosenLanes.add(lane);
      }
    }

    double baseTop = -0.6;
    double largeGap = 0.5;

    bool canSpawnFirst = !policeCars.any(
            (car) => (car['lane'] == chosenLanes[0] && (car['top'] - baseTop).abs() < largeGap));

    bool canSpawnSecond = !policeCars.any(
            (car) => (car['lane'] == chosenLanes[1] && (car['top'] - (baseTop - largeGap)).abs() < largeGap));

    if (canSpawnFirst) {
      policeCars.add({
        'lane': chosenLanes[0],
        'top': baseTop,
      });
    }

    if (canSpawnSecond) {
      policeCars.add({
        'lane': chosenLanes[1],
        'top': baseTop - largeGap,
      });
    }
  }

  void updatePositions() {
    double step = 0.005;

    for (var car in policeCars) {
      car['top'] += step;
    }

    policeCars.removeWhere((car) => car['top'] > 1.2);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}