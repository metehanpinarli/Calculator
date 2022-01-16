part of 'button_bloc.dart';

@immutable
abstract class ButtonEvent {}

class ButtonClicked extends ButtonEvent{
  final bool select;
  ButtonClicked(this.select);
}
