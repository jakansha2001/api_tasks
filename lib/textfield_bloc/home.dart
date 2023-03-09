import 'package:api_tasks/textfield_bloc/bloc/textfield_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldHome extends StatelessWidget {
  String output = '';
  // TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Textfield',
        ),
      ),
      body: Column(
        children: [
          TextField(
            // controller: textEditingController,
            onChanged: (value) {
              context.read<TextfieldBloc>().add(InputChangedEvent(input: value));
            },
          ),
          BlocBuilder<TextfieldBloc, TextfieldState>(
            builder: (context, state) {
              // TODO: implement listener
              if (state is TextfieldFinal) {
                output = state.output;
              }
              return ElevatedButton(
                onPressed: output.isEmpty? null : () {
                  print(output);
                },
                child: const Text(
                  'Click',
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
