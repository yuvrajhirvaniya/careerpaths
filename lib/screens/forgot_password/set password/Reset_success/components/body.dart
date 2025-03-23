// ignore_for_file: use_key_in_widget_constructors

import 'package:career_paths/animation/fade_animation.dart';
import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/screens/sign_in/sign_in_screen.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeAnimation(
          delay: 1,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Image.asset(
                "assets/images/success.png",
                height: SizeConfig.screenHeight * 0.4, //40%
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Text(
                "Password Reset Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        FadeAnimation(
          delay: 1.5,
          child: SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to SignIn",
              press: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                    (Route<dynamic> route) => false);
                // Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
