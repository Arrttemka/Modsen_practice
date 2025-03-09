import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
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