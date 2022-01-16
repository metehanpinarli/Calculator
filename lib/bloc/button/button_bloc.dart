import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonState()) {
    on<ButtonClicked>((event, emit) {
      emit(ButtonState(select: !event.select));
    });
  }
}
