import 'package:calculator_task/models/math_operations_model.dart';

class MathOperationsManager {

  int add(MathOperationsModel model) {
    int result = model.firstNumber + model.secondNumber;
    return result;
  }
  int subtract(MathOperationsModel model) {
    int result = model.firstNumber - model.secondNumber;
    return result;
  }
  double divide(MathOperationsModel model) {
    double result = model.firstNumber / model.secondNumber;
    return result;
  }
  int multiply(MathOperationsModel model) {
    int result = model.firstNumber * model.secondNumber;
    return result;
  }
}
