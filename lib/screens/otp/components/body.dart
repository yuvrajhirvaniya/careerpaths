import 'package:career_paths/animation/fade_animation.dart';
import 'package:career_paths/constants.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  final String id;
  Body({
    required this.id,
  });
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                FadeAnimation(
                  delay: 1,
                  child: Column(
                    children: [
                      Text(
                        "OTP Verification",
                        style: headingStyle,
                      ),
                      Text("We sent you code into your email"),
                      buildTimer(),
                    ],
                  ),
                ),
                OtpForm(id: widget.id),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: FadeAnimation(
                    delay: 1.5,
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(minutes: 30),
          builder: (_, dynamic value, child) => Text(
            "${value.toInt()}:",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          onEnd: () {},
          duration: Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
