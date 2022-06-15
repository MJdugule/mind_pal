import 'package:flutter/material.dart';
import 'package:mind_pal/screens/onboarding.dart';
import 'package:mind_pal/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Mind Pal',
      home: Splashscreen(),
    );
  }
}
