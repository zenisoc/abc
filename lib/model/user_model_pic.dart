// To parse this JSON data, do
//
//     final picArts = picArtsFromJson(jsonString);

import 'dart:convert';

List<PicArts> picArtsFromJson(String str) => List<PicArts>.from(json.decode(str).map((x) => PicArts.fromJson(x)));

String picArtsToJson(List<PicArts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PicArts {
  PicArts({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PicArts.fromJson(Map<String, dynamic> json) => PicArts(
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
