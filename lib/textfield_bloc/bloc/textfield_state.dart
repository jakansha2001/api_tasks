part of 'textfield_bloc.dart';

@immutable
abstract class TextfieldState {}

class TextfieldInitial extends TextfieldState {}

class TextfieldFinal extends TextfieldState {
  final String output;

  TextfieldFinal({required this.output});

}
