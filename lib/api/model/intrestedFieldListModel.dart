class IntrestedFieldList {
  IntrestedFieldList({
    required this.courseName,
    required this.coursePhoto,
    required this.courseDescription,
    required this.eligiblity,
  });
  late final String courseName;
  late final String coursePhoto;
  late final String courseDescription;
  late final String eligiblity;

  IntrestedFieldList.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName'];
    coursePhoto = json['coursePhoto'];
    courseDescription = json['courseDescription'];
    eligiblity = json['eligiblity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['courseName'] = courseName;
    _data['coursePhoto'] = coursePhoto;
    _data['courseDescription'] = courseDescription;
    _data['eligiblity'] = eligiblity;
    return _data;
  }
}
