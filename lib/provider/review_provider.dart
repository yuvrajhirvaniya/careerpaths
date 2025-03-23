import 'package:career_paths/api/instituteController.dart';
import 'package:career_paths/model/review/viewReview.dart';
import 'package:flutter/material.dart';

class ReviewProvider with ChangeNotifier {
  final institute = InstituteApi();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ViewReview> _reviewList = [];
  List<ViewReview> get reviewList => _reviewList;

  getReviewList(String instituteid) async {
    _reviewList = await institute.getReiviewList(instituteid);
    print(_reviewList);

    notifyListeners();
  }

  giveReview(String instituteId, String stundentId, double rating, String date,
      BuildContext context, String msg) async {
    _isLoading = true;
    notifyListeners();

    await institute.giveReview(
        instituteId, stundentId, rating, date, msg, context);
    getReviewList(instituteId);

    _isLoading = false;
    notifyListeners();
  }
}
