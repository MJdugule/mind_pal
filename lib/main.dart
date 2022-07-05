import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mind_pal/screens/home/home.dart';

import 'package:mind_pal/screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      title: 'Mind Pal',
      home: const Splashscreen(),
      routes: {
        'homeScreen': (_) => const HomeScreen(),
        'splashScreen': (_) => const Splashscreen(),
      },
    );
  }
}
