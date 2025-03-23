import 'dart:convert';

import 'package:career_paths/model/institute_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/courses_fee_model.dart';
import '../model/faculty_model.dart';
import '../model/gallery_model.dart';
import '../model/merit_model.dart';
import '../model/review/viewReview.dart';
import 'Const Api/api_constant.dart';

class InstituteApi {
  //for the give review api
  Future<bool> giveReview(String instituteId, String stundentId, double rating,
      String date, String msg, BuildContext context) async {
    final uri = Uri.parse(ApiConstant.giveReviewUrl);
    var body = {
      "instituteId": instituteId,
      "rating": rating.toString(),
      "date": date,
      "message": msg,
      "studentId": stundentId
    };
    final newbody = json.encode(body);

    var response = await http.post(uri, body: newbody);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(
            child: Text(
              "Review Submitted",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(
            child: Text(
              "Failed to submit review",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
      return false;
    }
  }

  //for the basic information showing
  Future<List<InstituteModel>> getInstituteList() async {
    final uri = Uri.parse(ApiConstant.instituteData);
    var response = await http.get(uri);
    List<InstituteModel> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        InstituteModel model = InstituteModel.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }

  //for the institute gallery showing
  Future<List<Gallery>> getGalleryList(String instituteid) async {
    final uri = Uri.parse(ApiConstant.galleryData + instituteid);
    var response = await http.get(uri);
    List<Gallery> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        Gallery model = Gallery.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }

  //for the institute courses and fee structure showing
  Future<List<Course>> getCourseList(String instituteid) async {
    final uri = Uri.parse(ApiConstant.courseData + instituteid);
    var response = await http.get(uri);
    List<Course> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        Course model = Course.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }

  //for the institute faculty showing
  Future<List<FacultyModel>> getFacultyList(String instituteid) async {
    final uri = Uri.parse(ApiConstant.facultyData + instituteid);
    var response = await http.get(uri);
    List<FacultyModel> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        FacultyModel model = FacultyModel.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }

  //for the institute review showing
  Future<List<ViewReview>> getReiviewList(String instituteid) async {
    final uri = Uri.parse(ApiConstant.viewReviewUrl + instituteid);
    var response = await http.get(uri);
    List<ViewReview> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        ViewReview model = ViewReview.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }

  //for the showing merit data
  Future<List<MeritModel>> getMeritList(String courseid) async {
    final uri = Uri.parse(ApiConstant.viewMeritData + courseid);
    var response = await http.get(uri);
    List<MeritModel> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        MeritModel model = MeritModel.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }
}
