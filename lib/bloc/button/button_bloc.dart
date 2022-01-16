import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonState()) {
    on<ButtonClicked>(_onButtonClicked);
    on<ButtonClear>(_onButtonClear);
  }

  FutureOr<void> _onButtonClear(event, emit) {
    emit(ButtonState());
  }
  FutureOr<void> _onButtonClicked(event, emit) {
    late bool buttonAdd;
    late bool buttonSubtract;
    late bool buttonMultiply;
    late bool buttonDivide;
    switch (event.operation) {
      case "+":
        buttonAdd=true;
        buttonSubtract=false;
        buttonMultiply=false;
        buttonDivide=false;
        break;
      case "-":
        buttonAdd=false;
        buttonSubtract=true;
        buttonMultiply=false;
        buttonDivide=false;
        break;
      case "/":
        buttonAdd=false;
        buttonSubtract=false;
        buttonMultiply=false;
        buttonDivide=true;
        break;
      case "*":
        buttonAdd=false;
        buttonSubtract=false;
        buttonMultiply=true;
        buttonDivide=false;
        break;
    }
    emit(ButtonState(buttonAdd: buttonAdd,buttonDivide: buttonDivide,buttonMultiply: buttonMultiply,buttonSubtract: buttonSubtract));
  }
}
