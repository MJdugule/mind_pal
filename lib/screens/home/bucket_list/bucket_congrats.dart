import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class BucketCongrats extends StatelessWidget {
  const BucketCongrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/bucket_congrats.png'),
            Text(
              'Congratulations!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: purpleText,
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: ResConfig.screenWidth / 1.5,
              child: Text(
                'It\'s time to write those dreams into existence.',
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
    );
  }
}
