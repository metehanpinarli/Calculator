// ignore_for_file: overridden_fields

part of 'calculator_bloc.dart';

class CalculatorState {
  final CalculatorModel? model;
  List<dynamic>? history;
  CalculatorState({this.model, this.history});
}

class CalculatorCompleted extends CalculatorState {
  @override
  final CalculatorModel? model;
  @override
  final List<dynamic>? history;
  CalculatorCompleted({this.model,this.history});
}

class CalculatorEmpty extends CalculatorState {
  CalculatorEmpty();
}

class CalculatorError extends CalculatorState {
  final String message;
  final MaterialColor backgroundColors;
  final Duration duration;
  final Color textColors;
  CalculatorError(this.message,this.backgroundColors,this.duration,this.textColors);
}
