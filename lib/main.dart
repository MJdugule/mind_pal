import 'package:flutter/material.dart';
import 'package:mind_pal/screens/on_boarding.dart';
import 'package:mind_pal/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind Pal',
      initialRoute: initScreen == 0 || initScreen == null
          ? 'onBoardingScreen'
          : 'splashScreen',
      routes: {
        'onBoardingScreen': (_) => const OnBoarding(),
        'splashScreen': (_) => const Splashscreen(),
      },
    );
  }
}
