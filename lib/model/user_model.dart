// To parse this JSON data, do
//
//     final dummy = dummyFromJson(jsonString);

import 'dart:convert';

List<String> dummyFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String dummyToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
