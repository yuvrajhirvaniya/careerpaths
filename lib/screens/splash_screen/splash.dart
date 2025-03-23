// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'package:career_paths/screens/dashboard/dash_page.dart';
import 'package:career_paths/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../animation/fade_animation.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool login = false;
  loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.getBool("login") ?? false;
  }

  @override
  initState() {
    super.initState();
    loadData();
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => login ? const DashPage() : SplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            delay: 2,
            child: Image.asset(
              "assets/cp.png",
              height: 250,
            ),
          ),
          FadeAnimation(
            delay: 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Career",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                Text(
                  " Paths",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
