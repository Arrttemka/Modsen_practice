import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_car_game/controllers/score_controller.dart';
import '../utils/text_styles.dart';

class ScoreWidget extends StatelessWidget {
  final ScoreController scoreController = Get.find<ScoreController>();

  ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 20,
      child: Obx(() => Text(
        'Score: ${scoreController.score.value}\nHighest Score: ${scoreController.highScore.value}',
        style: AppTextStyles.scoreText,
      )),
    );
  }
}