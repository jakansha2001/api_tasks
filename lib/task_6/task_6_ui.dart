import 'package:api_tasks/task_6/bloc/api_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocUI extends StatelessWidget {
  const BlocUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<ApiBlocBloc, ApiBlocState>(
          listener: (context, state) {
            if (state is ApiBlocError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ApiBlocLoading) {
              return const CircularProgressIndicator();
            } else if (state is ApiBlocSuccess) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Text(state.posts[index].title!);
                },
              );
            }
            return ElevatedButton(
              onPressed: () {
                context.read<ApiBlocBloc>().add(FetchPostEvent());
              },
              child: const Text(
                'Click',
              ),
            );
          },
        ),
      ),
    );
  }
}
