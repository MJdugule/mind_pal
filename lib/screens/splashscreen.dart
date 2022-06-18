import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/screens/on_boarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OnBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF6E8DF),
        body: Center(
          child: Image.asset(
            "assets/images/splash.png",
          ),
        ));
  }
}
