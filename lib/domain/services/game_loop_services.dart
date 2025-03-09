import 'dart:async';
import 'package:police_car_game/controllers/car_controller.dart';
import 'package:police_car_game/controllers/police_car_controller.dart';

class GameLoopService {
  final CarController carController;
  final PoliceCarController policeCarController;
  Timer? _timer;

  GameLoopService({
    required this.carController,
    required this.policeCarController,
  });

  void start() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (policeCarController.isCrashed.value) {
        stop();
        return;
      }

      if (timer.tick % 20 == 0) {
        policeCarController.spawnPoliceCar();
      }

      policeCarController.checkCollisions(carController.currentLane.value, 0.84);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
  }
}