class UserModel {
  UserModel({
    required this.studentId,
    required this.studentName,
    required this.gender,
    this.bdate,
    this.profilePhoto,
    required this.email,
    required this.contact,
    required this.lastEducation,
    required this.stuPassword,
    required this.address,
    required this.otp,
    required this.resetOtp,
    required this.verified,
  });
  late final String studentId;
  late final String studentName;
  late final String gender;
  String? bdate;
  String? profilePhoto;
  late final String email;
  late final String contact;
  late final String lastEducation;
  late final String stuPassword;
  late final String address;
  late final String otp;
  late final String resetOtp;
  late final String verified;

  UserModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    gender = json['gender'];
    bdate = json['bdate'];
    profilePhoto = json['profilePhoto'];
    email = json['email'];
    contact = json['contact'];
    lastEducation = json['lastEducation'];
    stuPassword = json['stuPassword'];
    address = json['address'];
    otp = json['otp'];
    resetOtp = json['reset_otp'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['studentId'] = studentId;
    _data['studentName'] = studentName;
    _data['gender'] = gender;
    _data['bdate'] = bdate;
    _data['profilePhoto'] = profilePhoto;
    _data['email'] = email;
    _data['contact'] = contact;
    _data['lastEducation'] = lastEducation;
    _data['stuPassword'] = stuPassword;
    _data['address'] = address;
    _data['otp'] = otp;
    _data['reset_otp'] = resetOtp;
    _data['verified'] = verified;
    return _data;
  }
}
