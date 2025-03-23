// ignore_for_file: use_key_in_widget_constructors

import 'package:career_paths/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
