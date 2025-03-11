import 'package:flutter/material.dart';
import '../domain/entities/police_car.dart';

class PoliceCarWidget extends StatelessWidget {
  final List<PoliceCar> policeCars;

  const PoliceCarWidget({Key? key, required this.policeCars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: policeCars.map((car) {
        return Positioned(
          top: screenHeight * car.top,
          left: screenWidth * car.lane,
          child: Image.asset(
            'assets/images/police_car.png',
            width: screenWidth * 0.2,
            height: screenHeight * 0.1,
          ),
        );
      }).toList(),
    );
  }
}