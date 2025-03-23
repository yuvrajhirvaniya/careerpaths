// To parse this JSON data, do
//
//     final instituteModel = instituteModelFromJson(jsonString);

import 'dart:convert';

List<InstituteModel> instituteModelFromJson(String str) =>
    List<InstituteModel>.from(
        json.decode(str).map((x) => InstituteModel.fromJson(x)));

String instituteModelToJson(List<InstituteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstituteModel {
  InstituteModel({
    required this.instituteId,
    required this.instituteName,
    required this.institutePhoto,
    required this.socialMedia,
    required this.location,
    required this.mission,
    required this.history,
    required this.achievement,
    required this.city,
    required this.contact,
    required this.instituteEmail,
    required this.verifyCode,
    required this.verified,
    required this.ratings,
    required this.topInstitute,
    this.favouriteInstitute,
  });

  String instituteId;
  String instituteName;
  String institutePhoto;
  String socialMedia;
  String location;
  String mission;
  String history;
  String achievement;
  String city;
  String contact;
  String instituteEmail;
  String verifyCode;
  String verified;
  String ratings;
  String topInstitute;
  String? favouriteInstitute;

  factory InstituteModel.fromJson(Map<String, dynamic> json) => InstituteModel(
        instituteId: json["instituteId"],
        instituteName: json["instituteName"],
        institutePhoto: json["institutePhoto"],
        socialMedia: json["socialMedia"],
        location: json["location"],
        mission: json["mission"],
        history: json["history"],
        achievement: json["achievement"],
        city: json["city"],
        contact: json["contact"],
        instituteEmail: json["instituteEmail"],
        verifyCode: json["verifyCode"],
        verified: json["verified"],
        ratings: json["ratings"],
        topInstitute: json["topInstitute"],
        favouriteInstitute: json["favouriteInstitute"],
      );

  Map<String, dynamic> toJson() => {
        "instituteId": instituteId,
        "instituteName": instituteName,
        "institutePhoto": institutePhoto,
        "socialMedia": socialMedia,
        "location": location,
        "mission": mission,
        "history": history,
        "achievement": achievement,
        "city": city,
        "contact": contact,
        "instituteEmail": instituteEmail,
        "verifyCode": verifyCode,
        "verified": verified,
        "ratings": ratings,
        "topInstitute": topInstitute,
        "favouriteInstitute": favouriteInstitute,
      };

}
