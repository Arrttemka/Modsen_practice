import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/car_cubit.dart';
import '../cubit/car_state.dart';
import '../cubit/police_car_cubit.dart';
import '../cubit/police_car_state.dart';
import '../cubit/score_cubit.dart';
import '../cubit/score_state.dart';
import '../domain/services/game_loop_service.dart';
import '../widgets/arrows_widget.dart';
import '../widgets/car_widget.dart';
import '../widgets/road_lines_widget.dart';
import '../widgets/police_car_widget.dart';
import '../widgets/score_widget.dart';

class RacePage extends StatefulWidget {
  const RacePage({Key? key}) : super(key: key);

  @override
  State<RacePage> createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> with TickerProviderStateMixin {
  late GameLoopService gameLoopService;

  @override
  void initState() {
    super.initState();

    final carCubit = context.read<CarCubit>();
    final policeCarCubit = context.read<PoliceCarCubit>();
    final scoreCubit = context.read<ScoreCubit>();

    policeCarCubit.initialize(this, context: context);

    gameLoopService = GameLoopService(
      carCubit: carCubit,
      policeCarCubit: policeCarCubit,
      scoreCubit: scoreCubit,
    );
    gameLoopService.start();
  }

  @override
  void dispose() {
    gameLoopService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<PoliceCarCubit>().setContext(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: const Color(0xFFCCCCCC))),
          const RoadLinesWidget(),
          BlocBuilder<PoliceCarCubit, PoliceCarState>(
            builder: (context, state) {
              return PoliceCarWidget(policeCars: state.policeCars);
            },
          ),
          BlocBuilder<CarCubit, CarState>(
            builder: (context, state) {
              return CarWidget(laneIndex: state.currentLane);
            },
          ),
          ArrowsWidget(
            onLeftTap: () => context.read<CarCubit>().moveLeft(),
            onRightTap: () => context.read<CarCubit>().moveRight(),
          ),
          BlocBuilder<ScoreCubit, ScoreState>(
            builder: (context, state) {
              return ScoreWidget(
                score: state.score,
                highScore: state.highScore,
              );
            },
          ),
        ],
      ),
    );
  }
}