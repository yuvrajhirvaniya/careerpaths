import 'package:career_paths/provider/favourite_provider.dart';
import 'package:career_paths/provider/profile_provider.dart';
import 'package:career_paths/provider/review_provider.dart';
import 'package:career_paths/screens/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Favprovider>(
          create: (_) => Favprovider(),
        ),
        ChangeNotifierProvider<ReviewProvider>(
          create: (_) => ReviewProvider(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Career Paths',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        home: const splash(),
        routes: routes,
      ),
    );
  }
}
