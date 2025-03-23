import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatefulWidget {
  static String routeName = "/complete_profile";
  final String email;
  final String password;
  final String gender;
  const CompleteProfileScreen(
      {super.key,
      required this.email,
      required this.password,
      required this.gender});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Body(
          email: widget.email,
          password: widget.password,
          gender: widget.gender),
    );
  }
}
