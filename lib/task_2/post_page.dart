import 'package:api_tasks/task_2/app_service.dart';
import 'package:api_tasks/task_2/posts_model.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final String? pageTitle;
  const PostPage({super.key, this.pageTitle});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var name = 'Apple';
  List<PostsModel> listPost = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void changeName() async {
    listPost = await AppService().getPost();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle ?? 'Akansha'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  changeName();
                },
                child: const Center(child: Text('Click!')),
              ),
              ListView.separated(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
