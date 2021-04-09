// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    this.email,
    this.username,
    this.tokens,
  });

  String email;
  String username;
  Tokens tokens;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    email: json["email"],
    username: json["username"],
    tokens: Tokens.fromJson(json["tokens"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "username": username,
    "tokens": tokens.toJson(),
  };
}

class Tokens {
  Tokens({
    this.refresh,
    this.access,
  });

  String refresh;
  String access;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}
