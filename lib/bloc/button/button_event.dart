part of 'button_bloc.dart';

@immutable
abstract class ButtonEvent {}

class ButtonClicked extends ButtonEvent{
  final bool select;
  final String? operation;
  ButtonClicked(this.select,this.operation);
}

class ButtonClear extends ButtonEvent{}
