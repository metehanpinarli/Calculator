import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator_task/infrastructure/calculator_repository.dart';
import 'package:calculator_task/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';

part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorRepository _calculatorRepository;

  CalculatorBloc(this._calculatorRepository) : super(CalculatorState()) {
    on<CalculatorClear>(_onCalculatorClear);
    on<CalculatorAddOperator>(_onCalculatorAddOperator);
    on<CalculatorResult>(_onCalculatorResult);
    on<CalculatorNullValue>(_onCalculatorNullValue);
  }

  FutureOr<void> _onCalculatorNullValue(event, emit)async {
    emit(CalculatorError("Please do not leave blank",Colors.red,const Duration(milliseconds:500),Colors.white));
  }

  FutureOr<void> _onCalculatorClear(event, emit) {
    emit(CalculatorState());
  }

  FutureOr<void> _onCalculatorAddOperator(event, emit) {
    List<dynamic>? _list = state.history ?? [];
    _list.isNotEmpty ? emit(CalculatorCompleted(model: CalculatorModel().copyWith(operator: event.operator), history: _list)) : emit(CalculatorState(model: CalculatorModel().copyWith(operator: event.operator), history: _list));
  }

  FutureOr<void> _onCalculatorResult(event, emit) async {
    if(state.model==null){
      emit(CalculatorError("Please select transaction",Colors.red,const Duration(milliseconds: 500),Colors.white));
    }else{
      state.model!.firstNumber = event.firstNumber;
      state.model!.secondNumber = event.secondNumber;
      final failureOrResult = await _calculatorRepository.getResult(model: state.model!);
      failureOrResult.fold((failure) => emit(CalculatorError(failure.message,Colors.red,const Duration(milliseconds: 500),Colors.white)), (result) {
        state.history!.add(result);
        emit(CalculatorCompleted(model: CalculatorModel().copyWith(result: result, operator: state.model!.operator), history: state.history));
      });
    }
  }

}
