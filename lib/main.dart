import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/car_cubit.dart';
import 'cubit/police_car_cubit.dart';
import 'cubit/score_cubit.dart';
import 'pages/home_page.dart';
import 'pages/race_page.dart';
import 'pages/game_over_page.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarCubit>(create: (_) => CarCubit()),
        BlocProvider<PoliceCarCubit>(create: (_) => PoliceCarCubit()),
        BlocProvider<ScoreCubit>(create: (_) => ScoreCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Police Car Game',
        initialRoute: '/homepage',
        routes: {
          '/homepage': (context) => const HomePage(),
          '/race': (context) => const RacePage(),
          '/game_over': (context) => const GameOverPage(),
        },
      ),
    );
  }
}