// To parse this JSON data, do
//
//     final jodi = jodiFromJson(jsonString);

import 'dart:convert';

Jodi jodiFromJson(String str) => Jodi.fromJson(json.decode(str));

String jodiToJson(Jodi data) => json.encode(data.toJson());

class Jodi {
  Jodi({
    this.email,
    this.username,
    this.tokens,
  });

  String email;
  String username;
  Tokens tokens;

  factory Jodi.fromJson(Map<String, dynamic> json) => Jodi(
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
