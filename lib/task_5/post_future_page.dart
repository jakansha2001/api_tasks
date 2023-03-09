import 'package:api_tasks/task_2/app_service.dart';
import 'package:api_tasks/task_2/posts_model.dart';
import 'package:flutter/material.dart';



class PostFuturePage extends StatelessWidget {
  const PostFuturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: AppService().getPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final listPost = snapshot.data!;
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listPost.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(listPost[index].title ?? 'Akansha Jain'),
                    Text(
                      listPost[index].id.toString(),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error!');
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
