import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen extends StatefulWidget {
  final String id;
  OtpScreen({
    required this.id,
  });
  static String routeName = "/otp";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
