class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json.containsKey('userId') ? json['userId'] : 0;
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId.toString();
    data['id'] = id.toString();
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
