part of 'operations_bloc.dart';

@immutable
abstract class OperationsState {}

class OperationsInitial extends OperationsState {}

class OperationsLoading extends OperationsState {}

class OperationsCompleted extends OperationsState {
  var result;
  OperationsCompleted({required this.result});
}

class OperationsError extends OperationsState {
  final String message;

  OperationsError({required this.message});
}
