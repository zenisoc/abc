// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

List<ProfileData> profileDataFromJson(String str) => List<ProfileData>.from(json.decode(str).map((x) => ProfileData.fromJson(x)));

String profileDataToJson(List<ProfileData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileData {
  ProfileData({
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
    this.siblings,
    this.religion,
    this.height,
    this.bio,
    this.profession,
    this.profileImageOne,
    this.profileImageTwo,
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
  int siblings;
  String religion;
  int height;
  String bio;
  String profession;
  String profileImageOne;
  String profileImageTwo;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
    siblings: json["siblings"],
    religion: json["religion"],
    height: json["height"],
    bio: json["bio"],
    profession: json["profession"],
    profileImageOne: json["profile_image_one"],
    profileImageTwo: json["profile_image_two"],
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
    "siblings": siblings,
    "religion": religion,
    "height": height,
    "bio": bio,
    "profession": profession,
    "profile_image_one": profileImageOne,
    "profile_image_two": profileImageTwo,
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
