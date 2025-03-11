import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final int highScore;

  const ScoreWidget({
    Key? key,
    required this.score,
    this.highScore = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 20,
      child: Text(
        'Score: $score\nHighest Score: $highScore',
        style: AppTextStyles.scoreText,
      ),
    );
  }
}