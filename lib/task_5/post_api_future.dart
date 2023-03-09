import 'package:api_tasks/task_2/app_service.dart';
import 'package:api_tasks/task_2/posts_model.dart';
import 'package:flutter/material.dart';

class PostApiFuture extends StatelessWidget {
  const PostApiFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: AppService().postPosts(PostsModel(
            userId: 2,
            id: 9,
            title:
                "are or do repels provide blacked out except option criticizes",
            body: "because I am awesome!")),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final response = snapshot.data!;
            return Text(response);
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
