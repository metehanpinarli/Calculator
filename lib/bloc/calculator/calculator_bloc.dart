import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator_task/infrastructure/calculator_repository.dart';
import 'package:calculator_task/models/calculator_model.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';

part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorRepository _calculatorRepository;

  CalculatorBloc(this._calculatorRepository) : super(CalculatorState()) {
    on<CalculatorClear>(_onCalculatorClear);
    on<CalculatorAddOperator>(_onCalculatorAddOperator);
    on<CalculatorResult>(_onCalculatorResult);
  }

  FutureOr<void> _onCalculatorClear(event, emit) {emit(CalculatorState());}

  FutureOr<void> _onCalculatorAddOperator(event, emit) {emit(CalculatorState(model: CalculatorModel().copyWith(operator: event.operator,)));}

  FutureOr<void> _onCalculatorResult(event, emit) async{
      state.model!.firstNumber = event.firstNumber;
      state.model!.secondNumber = event.secondNumber;
      final failureOrResult=await _calculatorRepository.getResult(model:state.model!);
      failureOrResult.fold((failure) =>emit(CalculatorError(failure.message)), (result) => emit(CalculatorCompleted(model: CalculatorModel().copyWith(result:result))));
      //,operator:state.model!.operator ilave edersek her işlemden sonra select kaybolmaz
  }

}
