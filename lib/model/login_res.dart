// To parse this JSON data, do
//
//     final loginRes = loginResFromJson(jsonString);

import 'dart:convert';

LoginRes loginResFromJson(String str) => LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) => json.encode(data.toJson());

class LoginRes {
  LoginRes({
    this.email,
    this.username,
    this.tokens,
  });

  String email;
  String username;
  Tokens tokens;

  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
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
