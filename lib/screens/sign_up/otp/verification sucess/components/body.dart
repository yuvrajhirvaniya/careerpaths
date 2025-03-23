import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/screens/dashboard/dash_page.dart';
import 'package:career_paths/screens/home/home_screen.dart';
import 'package:career_paths/screens/sign_in/sign_in_screen.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Registration Successfully",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
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
        Spacer(),
      ],
    );
  }
}
