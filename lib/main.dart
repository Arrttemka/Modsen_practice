import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/game_over_page.dart';

void main() {
  runApp(const PoliceCarGameApp());
}

class PoliceCarGameApp extends StatelessWidget {
  const PoliceCarGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Police Car Game',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/game_over': (context) => const GameOverPage(),
      },
    );
  }
}