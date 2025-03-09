import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_car_game/controllers/car_controller.dart';
import 'package:police_car_game/controllers/police_car_controller.dart';
import 'package:police_car_game/controllers/score_controller.dart';
import 'package:police_car_game/domain/services/game_loop_services.dart';
import 'package:police_car_game/widgets/arrows_widget.dart';
import 'package:police_car_game/widgets/car_widget.dart';
import 'package:police_car_game/widgets/road_lines_widget.dart';
import 'package:police_car_game/widgets/police_car_widget.dart';
import 'package:police_car_game/widgets/score_widget.dart';

class RacePage extends StatefulWidget {
  const RacePage({Key? key}) : super(key: key);

  @override
  State<RacePage> createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {
  final CarController carController = Get.put(CarController());
  final PoliceCarController policeCarController = Get.put(PoliceCarController());
  final ScoreController scoreController = Get.find<ScoreController>();

  late GameLoopService gameLoopService;

  @override
  void initState() {
    super.initState();
    gameLoopService = GameLoopService(
      carController: carController,
      policeCarController: policeCarController,
      scoreController: scoreController,
    );
    gameLoopService.start();
  }

  @override
  void dispose() {
    gameLoopService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: const Color(0xFFCCCCCC))),
          const RoadLinesWidget(),
          const PoliceCarWidget(),
          const CarWidget(),
          ArrowsWidget(
            onLeftTap: carController.moveLeft,
            onRightTap: carController.moveRight,
          ),
          ScoreWidget(),
        ],
      ),
    );
  }
}