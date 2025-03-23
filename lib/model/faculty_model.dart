class FacultyModel {
  FacultyModel({
    required this.facultyId,
    required this.instituteId,
    required this.facultyName,
    required this.facultyEmail,
    required this.facultyPost,
    required this.facultyPhoto,
    required this.facultyQualification,
    required this.experience,
    required this.department,
  });
  late final String facultyId;
  late final String instituteId;
  late final String facultyName;
  late final String facultyEmail;
  late final String facultyPost;
  late final String facultyPhoto;
  late final String facultyQualification;
  late final String experience;
  late final String department;

  FacultyModel.fromJson(Map<String, dynamic> json) {
    facultyId = json['facultyId'];
    instituteId = json['instituteId'];
    facultyName = json['facultyName'];
    facultyEmail = json['facultyEmail'];
    facultyPost = json['facultyPost'];
    facultyPhoto = json['facultyPhoto'];
    facultyQualification = json['facultyQualification'];
    experience = json['experience'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['facultyId'] = facultyId;
    _data['instituteId'] = instituteId;
    _data['facultyName'] = facultyName;
    _data['facultyEmail'] = facultyEmail;
    _data['facultyPost'] = facultyPost;
    _data['facultyPhoto'] = facultyPhoto;
    _data['facultyQualification'] = facultyQualification;
    _data['experience'] = experience;
    _data['department'] = department;
    return _data;
  }
}
