import 'package:calculator_task/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_task/infrastructure/calculator_repository.dart';
import 'package:calculator_task/manager/calculator_manager.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async{
  locator.registerFactory<CalculatorBloc>(() => CalculatorBloc(locator<CalculatorRepository>()));
  locator.registerLazySingleton<CalculatorRepository>(() => CalculatorRepository(locator<CalculatorManager>()));
  locator.registerLazySingleton<CalculatorManager>(() =>CalculatorManager());
}

