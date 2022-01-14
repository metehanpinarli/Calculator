import 'package:calculator_task/bloc/operations_bloc.dart';
import 'package:calculator_task/infrastructure/operations_repository.dart';
import 'package:calculator_task/manager/math_operations_manager.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async{
  locator.registerFactory<OperationsBloc>(() => OperationsBloc(locator<OperationsRepository>()));
  locator.registerLazySingleton<OperationsRepository>(() => OperationsRepository(locator<MathOperationsManager>()));
  locator.registerLazySingleton<MathOperationsManager>(() =>MathOperationsManager());
}

