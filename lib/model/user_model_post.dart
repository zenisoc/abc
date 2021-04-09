// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({

    this.id,
    this.createdAt,
  });


  String id;
  DateTime createdAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(

    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {

    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
