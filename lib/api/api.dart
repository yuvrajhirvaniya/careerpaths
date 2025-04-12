import 'dart:convert';
import 'dart:io';
import 'package:career_paths/api/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/profile_provider.dart';
import 'Const Api/api_constant.dart';
import 'model/intrestedFieldListModel.dart';

class LoginApi extends ProfileProvider {
  //this api for the sign-in
  Future<bool> login(String email, String pass) async {
    final uri = Uri.parse(ApiConstant.loginurl);
    final prefs = await SharedPreferences.getInstance();
    var body = {"email": email, "pass": pass};
    final newbody = json.encode(body);

    var response = await http.post(uri, body: newbody);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      print(data);
      var userData = data;
      UserModel user = UserModel.fromJson(userData);
      prefs.setString('studentId', user.studentId.toString());
      prefs.setString('studentName', user.studentName.toString());
      prefs.setString('gender', user.gender.toString());
      prefs.setString('bdate', user.bdate.toString());
      prefs.setString('profilePhoto', user.profilePhoto.toString());
      prefs.setString('email', user.email.toString());
      prefs.setString('contact', user.contact.toString());
      prefs.setString('lastEducation', user.lastEducation.toString());
      prefs.setString('address', user.address.toString());
      return true;
    } else {
      return false;
    }
  }

  //this api for the update profile
  Future<bool> updateProfile(
      String userid,
      String name,
      String contact,
      String address,
      String bdate,
      String gender,
      String qualification,
      File? image) async {
    final uri = Uri.parse(ApiConstant.profileUpdate);

    var request = http.MultipartRequest('POST', uri)
      ..fields['id'] = userid
      ..fields['name'] = name
      ..fields['ph_no'] = contact
      ..fields['address'] = address
      ..fields['b_date'] = bdate
      ..fields['gender'] = gender
      ..fields['qualification'] = qualification;
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        image.path,
      ));
    } else {
      request.fields['photo'] = '';
    }
    final prefs = await SharedPreferences.getInstance();
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = await http.Response.fromStream(response);
      var userData = jsonDecode(data.body);
      UserModel user = UserModel.fromJson(userData);
      print(userData);
      setname(user.studentName);
      setPhoto(user.profilePhoto ?? '');
      prefs.setString('studentId', user.studentId.toString());
      prefs.setString('studentName', user.studentName.toString());
      prefs.setString('gender', user.gender.toString());
      prefs.setString('bdate', user.bdate.toString());
      prefs.setString('profilePhoto', user.profilePhoto.toString());
      prefs.setString('email', user.email.toString());
      prefs.setString('contact', user.contact.toString());
      prefs.setString('lastEducation', user.lastEducation.toString());
      prefs.setString('address', user.address.toString());
      return true;
    } else {
      var da = await http.Response.fromStream(response);
      print("body" + da.body);
      return false;
    }
  }
}

//this api for the registration
class Signupapi {
  Future<String> signup(
    String email,
    String pass,
    String qualification,
    String fname,
    String lname,
    String phoneNumber,
    String address,
    String gender,
  ) async {
    final uri = Uri.parse(ApiConstant.signupUrl);
    var body = {
      "email": email,
      "password": pass,
      "first_name": fname,
      "last_name": lname,
      "phone_no": phoneNumber,
      "address": address,
      "gender": gender,
      "last_education": qualification,
    };
    final newbody = json.encode(body);

    var response = await http.post(uri, body: newbody);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      return data;
    } else {
      return '';
    }
  }
}

//this api for the registration verify and send otp
class signupVerification {
  Future<bool> signupVerify(String id, String otp) async {
    final uri = Uri.parse(ApiConstant.verificationUrl);
    var body = {"id": id, "otp": otp};
    final newbody = json.encode(body);
    var response = await http.post(uri, body: newbody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      print(data);
      return true;
    } else {
      var data = json.decode(response.body);
      print(data);
      return false;
    }
  }
}

//this api for the forgot password
class forgotPassword {
  //this api for the send email and get email id
  Future<String> emailSend(
    String email,
  ) async {
    final uri = Uri.parse(ApiConstant.emailForgot);
    var body = {"email": email};
    var newbody = json.encode(body);

    var response = await http.post(uri, body: newbody);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      print(data);
      return data;
    } else {
      var data = json.decode(response.body);
      print(data);
      return '';
    }
  }

  //this api for the send otp
  Future<bool> forgotPasswordVerification(String id, String otp) async {
    final uri = Uri.parse(ApiConstant.forgotOtp);
    var body = {"id": id, "otp": otp};
    final newbody = json.encode(body);
    var response = await http.post(uri, body: newbody);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //this api for the set new password
  Future<bool> setnewPassword(String id, String password) async {
    final uri = Uri.parse(ApiConstant.forgotPassword);
    var body = {
      "id": id,
      "pass": password,
    };
    final newbody = json.encode(body);
    var response = await http.post(uri, body: newbody);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

class quizApi {
  Future<List<IntrestedFieldList>> getIntrestedFieldList() async {
    final uri = Uri.parse(ApiConstant.getIntrestedFieldList);
    var response = await http.get(uri);
    List<IntrestedFieldList> list = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      for (var data in responseData) {
        IntrestedFieldList model = IntrestedFieldList.fromJson(data);
        list.add(model);
      }
      return list;
    }
    return list;
  }

  Future giveQuiz(
    List<String> interestedFileds,
  ) async {
    var deptname = interestedFileds.map((c) => "'$c'").toList().join(',');
    final uri = Uri.parse("${ApiConstant.giveQuiz}?dept=$deptname");
    print(uri);
    var body = interestedFileds;

    final newbody = json.encode(body);

    var response = await http.post(uri, body: newbody);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
