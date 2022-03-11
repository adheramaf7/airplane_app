import 'package:airplane_app/ui/pages/bonus_page.dart';
import 'package:airplane_app/ui/pages/main_page.dart';
import 'package:airplane_app/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'ui/pages/get_started_page.dart';
import 'ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStartedPage(),
        '/signup': (context) => const SignupPage(),
        '/bonus': (context) => const BonusPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
