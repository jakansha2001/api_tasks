import 'dart:convert';

import 'package:api_tasks/task_2/posts_model.dart';
import 'package:api_tasks/task_3/images_model.dart';

import 'package:http/http.dart' as http;

class AppService {
  Future<List<PostsModel>> getPost() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    var posts = await http.get(Uri.parse(url));
    print(posts);
    final List post = jsonDecode(posts.body);
    final data = post.map((e) => PostsModel.fromJson(e)).toList();
    return data;
  }

  Future<String> postPosts(PostsModel postsModel) async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.post(
      Uri.parse(url),
      body: postsModel.toJson(),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      return 'Created';
    } else {
      return 'Error';
    }
  }

  Future<List<ImagesModel>> getImage() async {
    const url = 'https://jsonplaceholder.typicode.com/photos';
    var images = await http.get(Uri.parse(url));
    final image = imagesModelFromJson(images.body);
    return image;
  }
}
