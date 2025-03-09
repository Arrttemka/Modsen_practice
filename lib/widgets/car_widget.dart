import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_car_game/controllers/car_controller.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final CarController carController = Get.find<CarController>();

    List<double> lanePositions = [
      screenWidth * 0.15,
      screenWidth * 0.4 ,
      screenWidth * 0.65,
    ];

    return Obx(() => AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: screenHeight * 0.84,
      left: lanePositions[carController.currentLane.value],
      child: Transform.rotate(
        angle: -90 * 3.1415926535 / 180,
        child: Image.asset(
          'assets/images/my_car.png',
          width: screenWidth * 0.2,
          height: screenHeight * 0.1,
        ),
      ),
    ));
  }
}
