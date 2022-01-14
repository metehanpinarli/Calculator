import 'package:calculator_task/manager/math_operations_manager.dart';
import 'package:calculator_task/models/failure_model.dart';
import 'package:calculator_task/models/math_operations_model.dart';
import 'package:dartz/dartz.dart';

class OperationsRepository {
  final MathOperationsManager _operationsManager;
  OperationsRepository(this._operationsManager);


  Future <Either<Failure, int>> add({required MathOperationsModel model}) async{
    try {
      int result = _operationsManager.add(model);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Hata"));
    }
  }

  Future <Either<Failure, int>> subtract({required MathOperationsModel model}) async{
    try {
      int result = _operationsManager.subtract(model);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Hata"));
    }
  }

  Future <Either<Failure, double>> divide({required MathOperationsModel model}) async{
    try {
      double result = _operationsManager.divide(model);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Hata"));
    }
  }

  Future <Either<Failure,int>> multiply({required MathOperationsModel model}) async{
    try {
      int result = _operationsManager.multiply(model);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Hata"));
    }
  }

}
