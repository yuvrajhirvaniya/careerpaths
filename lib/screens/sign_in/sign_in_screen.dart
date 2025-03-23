import 'package:flutter/material.dart';
import 'package:career_paths/size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Body(),
    );
  }
}
