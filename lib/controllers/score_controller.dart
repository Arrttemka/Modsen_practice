import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreController extends GetxController {
  final RxInt score = 0.obs;

  final RxInt highScore = 0.obs;

  static const String highScoreKey = 'high_score_key';

  @override
  void onInit() {
    super.onInit();
    loadHighScore();
  }

  void incrementScore(int amount) {
    score.value += amount;
    if (score.value > highScore.value) {
      highScore.value = score.value;
      saveHighScore(highScore.value);
    }
  }

  void resetScore() {
    score.value = 0;
  }

  Future<void> loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    final storedHighScore = prefs.getInt(highScoreKey) ?? 0;
    highScore.value = storedHighScore;
  }

  Future<void> saveHighScore(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(highScoreKey, value);
  }
}