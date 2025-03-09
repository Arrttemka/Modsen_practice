import 'package:get/get.dart';

class CarController extends GetxController {
  final int totalLanes = 3;
  var currentLane = 1.obs;

  void moveLeft() {
    if (currentLane > 0) {
      currentLane--;
    }
  }

  void moveRight() {
    if (currentLane < totalLanes - 1) {
      currentLane++;
    }
  }
}
