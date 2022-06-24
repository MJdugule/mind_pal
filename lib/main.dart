import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/authentication/email_verification_screen.dart';
import 'package:mind_pal/screens/home/alltasks.dart';
import 'package:mind_pal/screens/home/create_new_tasks.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/screens/home/shared_tasks/create_first_task.dart';
import 'package:mind_pal/screens/home/shared_tasks/first_shared_task.dart';
import 'package:mind_pal/screens/on_boarding.dart';
import 'package:mind_pal/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await preferences.setInt('initScreen', 1);
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
      home: CreateFirstTask(),
      // initialRoute:
          // initScreen == 0 || initScreen == null ? 'homeScreen' : 'splashScreen',
      routes: {
        'homeScreen': (_) => const HomeScreen(),
        'splashScreen': (_) => const Splashscreen(),
      },
    );
  }
}
