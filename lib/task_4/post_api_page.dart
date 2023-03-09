import 'package:api_tasks/task_2/app_service.dart';
import 'package:api_tasks/task_2/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostApiPage extends StatelessWidget {
  const PostApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post API'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  PostsModel postsModel = PostsModel(
                      userId: 2,
                      id: 9,
                      title:
                          "are or do repels provide blacked out except option criticizes",
                      body: "because I am awesome!");

                  var res = await AppService().postPosts(postsModel);
                  debugPrint(res);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(res),
                  ));
                },
                child: const Text('Send Posts'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
