import 'package:flutter/material.dart';

class RoadLinesController {
  late AnimationController controller;
  late Animation<double> animation;

  RoadLinesController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    animation = Tween<double>(begin: 1, end: 0).animate(controller);
  }

  void dispose() {
    controller.dispose();
  }
}