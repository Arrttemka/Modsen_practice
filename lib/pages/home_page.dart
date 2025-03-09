import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/text_styles.dart';
import 'package:police_car_game/controllers/score_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scoreController = Get.find<ScoreController>();

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
                alignment: const Alignment(0.33, 0.0),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.08),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: size.height * 0.12,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.25,
                        height: size.height * 0.08,
                        decoration: const BoxDecoration(color: Colors.red),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Obx(() => Text(
                            '${scoreController.highScore.value}',
                            style: AppTextStyles.scoreNumber,
                          )),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: size.width * 0.44,
                        height: size.height * 0.06,
                        decoration: const BoxDecoration(color: Colors.red),
                        alignment: Alignment.center,
                        child: const Text(
                          'Best Score',
                          style: AppTextStyles.bestScore,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.82,
                  height: size.height * 0.074,
                  child: ElevatedButton(
                    onPressed: () {
                      scoreController.resetScore();
                      Navigator.pushReplacementNamed(context, '/race');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'START GAME',
                      style: AppTextStyles.startButton,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.08),
              ],
            ),
          ],
        ),
      ),
    );
  }
}