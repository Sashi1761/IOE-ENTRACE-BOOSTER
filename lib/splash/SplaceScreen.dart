import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projectapp/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
     const Duration(seconds: 3),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 237, 221, 226),
            Color.fromARGB(255, 98, 17, 17),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Image.asset(
        "assets/app_splash_logo.png",
        width: 200,
        height: 200,
      ),
    ),
  );
}
}