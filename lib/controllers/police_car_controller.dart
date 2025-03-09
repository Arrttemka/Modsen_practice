import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PoliceCarController extends GetxController with GetTickerProviderStateMixin {
  final int totalLanes = 3;
  var policeCars = <Map<String, dynamic>>[].obs;
  final Random _random = Random();
  var isCrashed = false.obs;

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
        if (!isCrashed.value) {
          updatePositions();
        }
      });
  }

  void spawnPoliceCar() {
    if (isCrashed.value) return;

    List<double> availableLanes = [0.15, 0.4, 0.65];
    double lane = availableLanes[_random.nextInt(availableLanes.length)];
    double top = -0.6;

    if (!policeCars.any((car) => car['lane'] == lane && (car['top'] - top).abs() < 0.5)) {
      policeCars.add({
        'lane': lane,
        'top': top,
      });
    }
  }

  void updatePositions() {
    if (isCrashed.value) return;

    double step = 0.005;
    for (var car in policeCars) {
      car['top'] += step;
    }

    policeCars.removeWhere((car) => car['top'] > 1.2);
  }

  void checkCollisions(int playerLane, double playerTop) {
    double playerHeight = 0.1;
    List<double> availableLanes = [0.15, 0.4, 0.65];
    double playerLanePosition = availableLanes[playerLane];

    for (var car in policeCars) {
      if (car['lane'] == playerLanePosition) {
        double carTop = car['top'];
        double carHeight = 0.1;
        if (carTop + carHeight > playerTop && carTop < playerTop + playerHeight) {
          onCrash();
          break;
        }
      }
    }
  }
  void onCrash() {
    print("Столкновение");
    isCrashed.value = true;
    controller.stop();
  }

  void resetGame() {
    isCrashed.value = false;
    policeCars.clear();
    controller.repeat();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}