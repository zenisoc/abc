// To parse this JSON data, do
//
//     final dang = dangFromJson(jsonString);

import 'dart:convert';

List<Dang> dangFromJson(String str) => List<Dang>.from(json.decode(str).map((x) => Dang.fromJson(x)));

String dangToJson(List<Dang> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dang {
  Dang({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Dang.fromJson(Map<String, dynamic> json) => Dang(
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
