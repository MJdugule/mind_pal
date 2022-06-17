import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/authentication/phone_verification_screen.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

import '../../shared_constants/res_config.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left:ResConfig.screenWidth /13, right: ResConfig.screenWidth/30, top: ResConfig.screenWidth / 1.7),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/image.png'),
              SizedBox(height: ResConfig.screenHeight / 20,),
              Text('Congratulations!',style: GoogleFonts.poppins(color: Color(0xFF393C7A), fontSize: 28, fontWeight: FontWeight.w700),),
              SizedBox(height: ResConfig.screenHeight / 45,),
              Text('You have successfully created your account',style: GoogleFonts.poppins(color: Color(0xFF393C7A), fontSize: 13, fontWeight: FontWeight.w600),),
              SizedBox(height: ResConfig.screenHeight / 10,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneVerificationScreen()));

                  },
                  child: GetStartedButton(color: Color(0xFF393c7A), text: 'Get Started', textColor: Color(0xFFFFFFFF)))


            ],
          ),
        ),


      ),
    );
  }
}
// 0235571375
