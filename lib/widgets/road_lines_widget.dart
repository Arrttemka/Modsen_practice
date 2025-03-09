import 'package:flutter/material.dart';
import 'package:police_car_game/controllers/road_lines_controller.dart';
import 'package:police_car_game/widgets/road_line.dart';

class RoadLinesWidget extends StatefulWidget {
  const RoadLinesWidget({Key? key}) : super(key: key);

  @override
  _RoadLinesWidgetState createState() => _RoadLinesWidgetState();
}

class _RoadLinesWidgetState extends State<RoadLinesWidget>
    with SingleTickerProviderStateMixin {
  late RoadLinesController roadLinesController;

  @override
  void initState() {
    super.initState();
    roadLinesController = RoadLinesController(this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double lineWidth = screenWidth * 0.04;
    double lineHeight = screenHeight * 0.124;
    double spacing = screenHeight * 0.1;

    List<double> linePositions = [
      screenWidth * 0.125 - lineWidth / 2,
      screenWidth * 0.375 - lineWidth / 2,
      screenWidth * 0.625 - lineWidth / 2,
      screenWidth * 0.875 - lineWidth / 2,
    ];

    return Positioned.fill(
      child: AnimatedBuilder(
        animation: roadLinesController.animation,
        builder: (context, child) {
          return Stack(
            children: linePositions.asMap().entries.expand((entry) {
              int columnIndex = entry.key;
              double leftPosition = entry.value;
              return List.generate(
                (screenHeight / (lineHeight + spacing)).ceil() + 2,
                    (index) {
                  double offset = (columnIndex.isEven ? 0 : spacing * 0.5);
                  double basePosition = index * (lineHeight + spacing);
                  double animatedOffset = roadLinesController.animation.value * (lineHeight + spacing);
                  double position = (basePosition - animatedOffset + screenHeight + offset) % (screenHeight + lineHeight) - lineHeight;

                  return RoadLine(
                    top: position,
                    left: leftPosition,
                    width: lineWidth,
                    height: lineHeight,
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    roadLinesController.dispose();
    super.dispose();
  }
}