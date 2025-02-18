import 'package:flutter/material.dart';
import '../../utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.33, 0.0),
                  ),
                ),
                Positioned(
                  top: size.height * 0.08,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: size.height * 0.12,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.34,
                  left: size.width * 0.38,
                  child: Container(
                    width: size.width * 0.25,
                    height: size.height * 0.08,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        '33',
                        style: AppTextStyles.scoreNumber,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.44,
                  left: size.width * 0.28,
                  child: Center(
                    child: Container(
                      width: size.width * 0.44,
                      height: size.height * 0.06,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Best Score',
                        style: AppTextStyles.bestScore,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.73,
                  left: size.width * 0.09,
                  child: SizedBox(
                    width: size.width * 0.82,
                    height: size.height * 0.074,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/race');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'START GAME',
                        style: AppTextStyles.startButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}