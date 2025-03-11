import 'package:get_it/get_it.dart';
import '../cubit/car_cubit.dart';
import '../cubit/police_car_cubit.dart';
import '../cubit/score_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CarCubit());
  sl.registerFactory(() => PoliceCarCubit());
  sl.registerFactory(() => ScoreCubit());
}