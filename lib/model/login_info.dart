// To parse this JSON data, do
//
//     final loginInfo = loginInfoFromJson(jsonString);

import 'dart:convert';

List<LoginInfo> loginInfoFromJson(String str) => List<LoginInfo>.from(json.decode(str).map((x) => LoginInfo.fromJson(x)));

String loginInfoToJson(List<LoginInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginInfo {
  LoginInfo({
    this.profileId,
    this.gender,
    this.interestedIn,
    this.community,
    this.profileImage,
    this.dateOfBirth,
    this.currentAddress,
    this.maritalStatus,
    this.citizenship,
    this.country,
    this.district,
    this.education,
    this.profile,
    this.category,
    this.siblings,
    this.religion,
    this.height,
    this.bio,
  });

  int profileId;
  String gender;
  String interestedIn;
  String community;
  String profileImage;
  DateTime dateOfBirth;
  String currentAddress;
  String maritalStatus;
  String citizenship;
  String country;
  String district;
  String education;
  Profile profile;
  Category category;
  int siblings;
  String religion;
  int height;
  String bio;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
    profileId: json["profile_id"],
    gender: json["gender"],
    interestedIn: json["interested_in"],
    community: json["community"],
    profileImage: json["profile_image"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    currentAddress: json["current_address"],
    maritalStatus: json["marital_status"],
    citizenship: json["citizenship"],
    country: json["country"],
    district: json["district"],
    education: json["education"],
    profile: Profile.fromJson(json["profile"]),
    category: Category.fromJson(json["category"]),
    siblings: json["siblings"],
    religion: json["religion"],
    height: json["height"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "profile_id": profileId,
    "gender": gender,
    "interested_in": interestedIn,
    "community": community,
    "profile_image": profileImage,
    "date_of_birth": dateOfBirth.toIso8601String(),
    "current_address": currentAddress,
    "marital_status": maritalStatus,
    "citizenship": citizenship,
    "country": country,
    "district": district,
    "education": education,
    "profile": profile.toJson(),
    "category": category.toJson(),
    "siblings": siblings,
    "religion": religion,
    "height": height,
    "bio": bio,
  };
}

class Category {
  Category({
    this.category,
  });

  String category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
  };
}

class Profile {
  Profile({
    this.id,
    this.email,
    this.username,
  });

  int id;
  String email;
  String username;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    email: json["email"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
  };
}
