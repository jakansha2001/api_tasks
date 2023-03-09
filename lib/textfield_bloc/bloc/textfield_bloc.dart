import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'textfield_event.dart';
part 'textfield_state.dart';

class TextfieldBloc extends Bloc<TextfieldEvent, TextfieldState> {
  TextfieldBloc() : super(TextfieldInitial()) {
    on<TextfieldEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<InputChangedEvent>(_handleInputChangedEvent);
  }

  void _handleInputChangedEvent(
    InputChangedEvent event,
    Emitter<TextfieldState> emit,
  ) {
    if (event.input.isEmpty) {
      emit(TextfieldFinal(output: event.input));
    } else {
      emit(TextfieldFinal(output: event.input + DateTime.now().toString()));
    }
  }
}
