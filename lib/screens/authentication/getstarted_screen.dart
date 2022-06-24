import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/authentication/phone_verification_screen.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

import '../../shared_constants/res_config.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: ResConfig.screenWidth / 13,
            right: ResConfig.screenWidth / 30,
            top: ResConfig.screenWidth / 5,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/get_started.png'),
                SizedBox(
                  height: ResConfig.screenHeight / 20,
                ),
                Text(
                  'Congratulations!',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF393C7A),
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 45,
                ),
                Text(
                  'You have successfully created your account',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF393C7A),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: const GetStartedButton(
                        color: Color(0xFF393c7A),
                        text: 'Get Started',
                        textColor: Color(0xFFFFFFFF)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// 0235571375
