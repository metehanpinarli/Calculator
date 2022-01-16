import 'package:calculator_task/models/calculator_model.dart';

class CalculatorManager {

  int add(CalculatorModel model) {
    int result = model.firstNumber! + model.secondNumber!;
    return result;
  }
  int subtract(CalculatorModel model) {
    int result = model.firstNumber! - model.secondNumber!;
    return result;
  }
  double divide(CalculatorModel model) {
    double result = model.firstNumber! / model.secondNumber!;
    return result;
  }
  int multiply(CalculatorModel model) {
    int result = model.firstNumber! * model.secondNumber!;
    return result;
  }
}
