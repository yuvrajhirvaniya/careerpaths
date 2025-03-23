import 'package:career_paths/components/coustom_bottom_nav_bar.dart';
import 'package:career_paths/enums.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
