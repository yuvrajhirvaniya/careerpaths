import 'package:career_paths/model/institute_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favprovider with ChangeNotifier {
  List<InstituteModel> _favList = [];
  List<InstituteModel> get favList => _favList;

  favtoggle(InstituteModel model) async {
    final prefs = await SharedPreferences.getInstance();

    var value = _favList.contains(model);
    value ? _favList.remove(model) : _favList.add(model);
    _favList;
    notifyListeners();
    final String encodedData = instituteModelToJson(favList);
    await prefs.setString('favList', encodedData);
    notifyListeners();
  }

  addMode(InstituteModel model) async {
    final prefs = await SharedPreferences.getInstance();
    _favList.add(model);
    notifyListeners();
    final String encodedData = instituteModelToJson(_favList);
    await prefs.setString('favList', encodedData);
    notifyListeners();
  }

  removeModel(InstituteModel model) async {
    final prefs = await SharedPreferences.getInstance();
    _favList.remove(model);
    notifyListeners();
    final String encodedData = instituteModelToJson(_favList);
    await prefs.setString('favList', encodedData);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getFavList() async {
    final prefs = await SharedPreferences.getInstance();
    var favString = prefs.getString('favList');
    if (favString != null) {
      _favList = instituteModelFromJson(favString);
      notifyListeners();
    } else {
      _favList = [];
      notifyListeners();
    }
  }

  getfavItem(InstituteModel element) {
    return _favList.contains(element);
  }
}
