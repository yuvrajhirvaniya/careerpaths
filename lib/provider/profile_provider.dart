import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  setname(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("studentName", name);
    getName();
    notifyListeners();
  }

  setPhoto(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("profilePhoto", name);
    getPhoto();
    notifyListeners();
  }

  String _name = '';
  String get name => _name;

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString("studentName") ?? '';
    notifyListeners();
  }

  String _photo = '';
  String get photo => _photo;

  getPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    _photo = prefs.getString("profilePhoto") ?? '';
    notifyListeners();
  }
}
