import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_car_game/controllers/police_car_controller.dart';

class PoliceCarWidget extends StatelessWidget {
  const PoliceCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final PoliceCarController policeCarController = Get.find<PoliceCarController>();

    return Obx(() => Stack(
      children: policeCarController.policeCars.map((car) {
        return Positioned(
          top: screenHeight * car['top'],
          left: screenWidth * car['lane'],
          child: Image.asset(
            'assets/images/police_car.png',
            width: screenWidth * 0.2,
            height: screenHeight * 0.1,
          ),
        );
      }).toList(),
    ));
  }
}
