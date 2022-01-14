part of 'operations_bloc.dart';

@immutable
abstract class OperationsEvent {}

class OperationsNoAction extends OperationsEvent {}

class OperationsAdd extends OperationsEvent {
  final MathOperationsModel model;
  OperationsAdd(this.model);
}

class OperationsSubtract extends OperationsEvent {
  final MathOperationsModel model;
  OperationsSubtract(this.model);
}

class OperationsDivide extends OperationsEvent {
  final MathOperationsModel model;
  OperationsDivide(this.model);
}

class OperationsMultiply extends OperationsEvent {
  final MathOperationsModel model;
  OperationsMultiply(this.model);
}
