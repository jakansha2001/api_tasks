// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ImagesModel> imagesModelFromJson(String str) => List<ImagesModel>.from(json.decode(str).map((x) => ImagesModel.fromJson(x)));

String imagesModelToJson(List<ImagesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImagesModel {
    ImagesModel({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
