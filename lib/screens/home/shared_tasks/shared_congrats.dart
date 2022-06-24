import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';
import 'package:mind_pal/screens/home/home.dart';

class SharedCongrats extends StatelessWidget {
  const SharedCongrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/image 37.png', height: 200,),
              SizedBox(height: ResConfig.screenHeight / 30,),
              Text(
                'Congratulations!',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: purpleText,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: ResConfig.screenHeight / 30,),
              SizedBox(
                width: ResConfig.screenWidth / 1,
                child: Text(
                  'You\'re ready to smash goals with\nthose you know',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: lightPurpleText,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: ResConfig.screenHeight / 10),
              const FeatureButtonBlue(route: HomeScreen(), text: 'Back to home'),
            ],
          ),
        ),
      ),
    );
  }
}
