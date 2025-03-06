import 'package:flutter/material.dart';
import 'package:police_car_game/widgets/arrows_widget.dart';
import 'package:police_car_game/widgets/car_widget.dart';
import 'package:police_car_game/widgets/road_lines_widget.dart';

class RacePage extends StatefulWidget {
  @override
  _RacePageState createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          Positioned.fill(
            child: Container(color: Color(0xFFCCCCCC)), // Фон дороги
          ),
          const RoadLinesWidget(), // Полоски дороги
          const CarWidget(), // Машина
          const ArrowsWidget(), // Кнопки управления
        ],
      )
    );
  }
}