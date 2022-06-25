import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/screens/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  isUserOnboarded() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final initScreen = preferences.getInt('initScreen') ?? 0;

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  initScreen == 0 ? const HomeScreen() : const OnBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isUserOnboarded(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: const Color(0xffF6E8DF),
          body: Center(
            child: Image.asset(
              "assets/images/splash.png",
            ),
          ),
        );
      },
    );
  }
}
