part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class CalculatorClear extends CalculatorEvent {
  CalculatorClear();
}

class CalculatorAddOperator extends CalculatorEvent {
  final String operator;
  CalculatorAddOperator(this.operator);
}

class CalculatorResult extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;
  CalculatorResult(this.firstNumber, this.secondNumber);
}

class CalculatorNullValue extends CalculatorEvent{
  CalculatorNullValue();
}