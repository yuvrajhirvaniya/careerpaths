import 'package:career_paths/constants.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

import 'complete_profile_form.dart';

class Body extends StatefulWidget {
  final String email;
  final String password;
  final String gender;
  const Body({
    super.key,
    required this.email,
    required this.password,
    required this.gender,
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
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text("Complete Profile", style: headingStyle),
                  const Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  CompleteProfileForm(
                      email: widget.email,
                      password: widget.password,
                      gender: widget.gender),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
