// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Posts> welcomeFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String welcomeToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  int? userId;
  int? id;
  String? title;
  String? body;

  Posts({
     this.userId,
     this.id,
     this.title,
     this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
