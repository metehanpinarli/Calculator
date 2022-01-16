part of 'calculator_bloc.dart';


class CalculatorState {
 final CalculatorModel? model;
  CalculatorState({this.model});
}

class CalculatorCompleted extends CalculatorState{
  final CalculatorModel? model;
 CalculatorCompleted({this.model});
}
class CalculatorEmpty extends CalculatorState{
 CalculatorEmpty();
}

class CalculatorError extends CalculatorState{
 final String message;
 CalculatorError(this.message);
}