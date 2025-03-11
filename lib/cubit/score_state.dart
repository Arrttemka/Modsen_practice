import 'package:equatable/equatable.dart';

class ScoreState extends Equatable {
  final int score;
  final int highScore;

  const ScoreState({
    required this.score,
    required this.highScore,
  });

  factory ScoreState.initial() => const ScoreState(
    score: 0,
    highScore: 0,
  );

  ScoreState copyWith({
    int? score,
    int? highScore,
  }) {
    return ScoreState(
      score: score ?? this.score,
      highScore: highScore ?? this.highScore,
    );
  }

  @override
  List<Object> get props => [score, highScore];
}