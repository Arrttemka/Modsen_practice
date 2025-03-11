import 'package:equatable/equatable.dart';

class PoliceCar extends Equatable {
  final double lane;
  final double top;

  const PoliceCar({
    required this.lane,
    required this.top,
  });

  @override
  List<Object> get props => [lane, top];
}