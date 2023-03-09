import 'package:api_tasks/task_3/bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageBlocPage extends StatelessWidget {
  const ImageBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is ImageSuccessState) {
              return ListView.builder(
                itemCount: state.image.length,
                itemBuilder: (context, index) {
                  return Image(image: NetworkImage(state.image[index].url));
                },
              );
            }
            if (state is ImageLoadingState) {
              return const CircularProgressIndicator();
            }
            return ElevatedButton(
              onPressed: () {
                context.read<ImageBloc>().add(GetImageEvent());
              },
              child: const Text('Get Images!'),
            );
          },
          listener: (context, state) {
            if (state is ImageErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error!'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
