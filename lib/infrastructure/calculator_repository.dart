import 'package:calculator_task/manager/calculator_manager.dart';
import 'package:calculator_task/models/failure_model.dart';
import 'package:calculator_task/models/calculator_model.dart';
import 'package:dartz/dartz.dart';

class CalculatorRepository {
  final CalculatorManager _calculatorManager;

  CalculatorRepository(this._calculatorManager);

  Future<Either<Failure, dynamic>> getResult({required CalculatorModel model}) async {
    try {
      dynamic result;
      switch (model.operator) {
        case "+":
          result = _calculatorManager.add(model);
          break;
        case "-":
          result = _calculatorManager.subtract(model);
          break;
        case "/":
          result = _calculatorManager.divide(model);
          break;
        case "*":
          result = _calculatorManager.multiply(model);
          break;

        default:
          return const Left(Failure("Please select the transaction type"));
      }

      return Right(result);
    } catch (e) {
      return const Left(Failure("Hata"));
    }
  }
}
