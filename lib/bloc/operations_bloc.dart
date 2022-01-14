import 'package:bloc/bloc.dart';
import 'package:calculator_task/infrastructure/operations_repository.dart';
import 'package:calculator_task/models/failure_model.dart';
import 'package:calculator_task/models/math_operations_model.dart';
import 'package:meta/meta.dart';

part 'operations_event.dart';
part 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  final OperationsRepository _repository;

  OperationsBloc(this._repository) : super(OperationsInitial()) {
    on<OperationsNoAction>(_onNoAction);
    on<OperationsAdd>(_onAdd);
    on<OperationsSubtract>(_onSubtract);
    on<OperationsDivide>(_onDivide);
    on<OperationsMultiply>(_onMultiply);
  }

  Future<void> _onNoAction(event, emit) async {
    emit(OperationsInitial());

  }

  Future<void> _onAdd(event, emit) async {
    emit(OperationsLoading());
    final failureOrResult = await _repository.add(model:event.model);
    failureOrResult.fold((failure)=>emit(OperationsError(message:failure.message)), (result) => emit(OperationsCompleted(result:result)));
  }

  Future<void> _onSubtract(event, emit) async {
    emit(OperationsLoading());
    final failureOrResult = await _repository.subtract(model:event.model);
    failureOrResult.fold((failure)=>emit(OperationsError(message:failure.message)), (result) => emit(OperationsCompleted(result:result)));
  }

  Future<void> _onDivide(event, emit) async {
    emit(OperationsLoading());
    final failureOrResult = await _repository.divide(model:event.model);
    failureOrResult.fold((failure)=>emit(OperationsError(message:failure.message)), (result) => emit(OperationsCompleted(result:result)));
  }

  Future<void> _onMultiply(event, emit) async {
    emit(OperationsLoading());
    final failureOrResult = await _repository.multiply(model:event.model);
    failureOrResult.fold((failure)=>emit(OperationsError(message:failure.message)), (result) => emit(OperationsCompleted(result:result)));
  }

}
