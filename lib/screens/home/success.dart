import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), (){
      Navigator.pop(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: const Icon(Icons.arrow_back)),
          ),
          SizedBox(
            height: ResConfig.screenHeight / 1.1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/circle_tick.png',
                    width: 70,
                    height: 70,
                  ),
                  Text(
                    'Success!',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: purpleText,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Your new task has been created.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: purpleText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
