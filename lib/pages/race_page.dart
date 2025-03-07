import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_car_game/controllers/car_controller.dart';
import 'package:police_car_game/controllers/police_car_controller.dart';
import 'package:police_car_game/widgets/arrows_widget.dart';
import 'package:police_car_game/widgets/car_widget.dart';
import 'package:police_car_game/widgets/road_lines_widget.dart';
import 'package:police_car_game/widgets/police_car_widget.dart';
import 'dart:async';

class RacePage extends StatelessWidget {
  RacePage({Key? key}) : super(key: key);

  final CarController carController = Get.put(CarController());
  final PoliceCarController policeCarController = Get.put(PoliceCarController());

  void startGameLoop() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      policeCarController.updatePositions();
      if (timer.tick % 20 == 0) {
        policeCarController.spawnPoliceCar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startGameLoop();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: const Color(0xFFCCCCCC)),
          ),
          const RoadLinesWidget(), // Полоски дороги
          const PoliceCarWidget(), // Вражеские машины
          const CarWidget(), // Игрок
          ArrowsWidget(
            onLeftTap: carController.moveLeft,
            onRightTap: carController.moveRight,
          ), // Кнопки управления
        ],
      ),
    );
  }
}
