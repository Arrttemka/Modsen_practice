import 'package:flutter/material.dart';

class ArrowsWidget extends StatelessWidget {
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  const ArrowsWidget({Key? key, required this.onLeftTap, required this.onRightTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      bottom: screenHeight * 0.03,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLeftTap,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Image.asset(
                'assets/images/arrow_left.png',
                width: screenWidth * 0.15,
                height: screenHeight * 0.08,
              ),
            ),
          ),
          GestureDetector(
            onTap: onRightTap,
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.05),
              child: Image.asset(
                'assets/images/arrow_right.png',
                width: screenWidth * 0.15,
                height: screenHeight * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
