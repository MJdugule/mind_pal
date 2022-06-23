import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/BucketList/bucket_list.dart';

import 'package:mind_pal/screens/BucketList/layout.dart';
import 'package:mind_pal/screens/BucketList/list_name.dart';
import 'package:mind_pal/screens/BucketList/my_list.dart';
import 'package:mind_pal/screens/BucketList/section.dart';
import 'package:mind_pal/screens/authentication/email_verification_screen.dart';
import 'package:mind_pal/screens/home/alltasks.dart';
import 'package:mind_pal/screens/home/create_new_tasks.dart';
import 'package:mind_pal/screens/on_boarding.dart';
import 'package:mind_pal/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // initScreen = preferences.getInt('initScreen');
  // await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Layout(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      title: 'Mind Pal',
      // initialRoute: initScreen == 0 || initScreen == null
      //     ? 'onBoardingScreen'
      //     : 'splashScreen',
      // routes: {
      //   'onBoardingScreen': (_) => const OnBoarding(),
      //   'splashScreen': (_) => const Splashscreen(),
      // },
    );
  }
}
