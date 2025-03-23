class Course {
  Course({
    required this.courseId,
    required this.instituteId,
    required this.courseName,
    required this.eligiblity,
    required this.duration,
    required this.fees,
  });
  late final String courseId;
  late final String instituteId;
  late final String courseName;
  late final String eligiblity;
  late final String duration;
  late final String fees;

  Course.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    instituteId = json['instituteId'];
    courseName = json['courseName'];
    eligiblity = json['eligiblity'];
    duration = json['duration'];
    fees = json['fees'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['courseId'] = courseId;
    _data['instituteId'] = instituteId;
    _data['courseName'] = courseName;
    _data['eligiblity'] = eligiblity;
    _data['duration'] = duration;
    _data['fees'] = fees;
    return _data;
  }
}
