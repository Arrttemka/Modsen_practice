import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'pages/race_page.dart';
import 'pages/game_over_page.dart';
import 'package:police_car_game/controllers/score_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ScoreController());

  runApp(const PoliceCarGameApp());
}

class PoliceCarGameApp extends StatelessWidget {
  const PoliceCarGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Police Car Game',
      theme: ThemeData.dark(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/race', page: () => const RacePage()),
        GetPage(name: '/game_over', page: () => const GameOverPage()),
      ],
    );
  }
}