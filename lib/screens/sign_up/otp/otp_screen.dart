import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen_signup extends StatefulWidget {
  static String routeName = "/otp";
  final String id;
  const OtpScreen_signup({
    super.key,
    required this.id,
  });
  @override
  State<OtpScreen_signup> createState() => _OtpScreen_signupState();
}

class _OtpScreen_signupState extends State<OtpScreen_signup> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(id: widget.id),
    );
  }
}
