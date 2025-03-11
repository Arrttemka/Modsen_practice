import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/score_cubit.dart';
import '../cubit/police_car_cubit.dart';
import '../cubit/car_cubit.dart';



class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreState = context.read<ScoreCubit>().state;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/game_over.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: ${scoreState.score}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.read<PoliceCarCubit>().resetGame();
                context.read<CarCubit>().resetLane();
                Navigator.pushReplacementNamed(context, '/homepage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Go to Home',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}