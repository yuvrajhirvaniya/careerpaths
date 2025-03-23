class ViewReview {
  ViewReview({
    required this.reviewId,
    required this.instituteId,
    required this.rating,
    required this.reviewDate,
    required this.message,
    required this.studentId,
    required this.studentName,
    required this.profilePhoto,
  });
  late final String reviewId;
  late final String instituteId;
  late final String rating;
  late final String reviewDate;
  late final String message;
  late final String studentId;
  late final String studentName;
  late final String profilePhoto;

  ViewReview.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    instituteId = json['instituteId'];
    rating = json['rating'];
    reviewDate = json['reviewDate'];
    message = json['message'];
    studentId = json['studentId'];
    studentName = json['studentName'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reviewId'] = reviewId;
    _data['instituteId'] = instituteId;
    _data['rating'] = rating;
    _data['reviewDate'] = reviewDate;
    _data['message'] = message;
    _data['studentId'] = studentId;
    _data['studentName'] = studentName;
    _data['profilePhoto'] = profilePhoto;
    return _data;
  }
}
