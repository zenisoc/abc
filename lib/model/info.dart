// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

List<Info> infoFromJson(String str) => List<Info>.from(json.decode(str).map((x) => Info.fromJson(x)));

String infoToJson(List<Info> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Info {
  Info({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
