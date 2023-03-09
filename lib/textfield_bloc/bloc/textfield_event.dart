part of 'textfield_bloc.dart';

@immutable
abstract class TextfieldEvent {}

class InputChangedEvent extends TextfieldEvent {
  final String input;

  InputChangedEvent({required this.input});
}
