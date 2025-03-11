import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  static const String highScoreKey = 'high_score_key';

  ScoreCubit() : super(ScoreState.initial()) {
    loadHighScore();
  }

  Future<void> loadHighScore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedHighScore = prefs.getInt(highScoreKey) ?? 0;
      emit(state.copyWith(highScore: storedHighScore));
    } catch (e) {
      print('Error loading high score: $e');
    }
  }

  void incrementScore(int amount) {
    final newScore = state.score + amount;
    final newState = state.copyWith(score: newScore);

    if (newScore > state.highScore) {
      saveHighScore(newScore);
      emit(newState.copyWith(highScore: newScore));
    } else {
      emit(newState);
    }
  }

  void resetScore() {
    emit(state.copyWith(score: 0));
  }

  Future<void> saveHighScore(int value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(highScoreKey, value);
    } catch (e) {
      print('Error saving high score: $e');
    }
  }
}