import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenHeight * 0.84,
      left: (screenWidth - (screenWidth * 0.274)) / 2,
      child: Transform.rotate(
        angle: -90 * 3.1415926535 / 180,
        child: Image.asset(
          'assets/images/my_car.png',
          width: screenWidth * 0.274,
          height: screenHeight * 0.0616,
        ),
      ),
    );
  }
}