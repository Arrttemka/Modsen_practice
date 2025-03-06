import 'package:flutter/material.dart';

class RoadLine extends StatelessWidget {
  final double top;
  final double left;
  final double width;
  final double height;

  const RoadLine({
    Key? key,
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}