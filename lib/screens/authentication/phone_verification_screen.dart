import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_constants/res_config.dart';


class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white,

      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left:ResConfig.screenWidth /13, right: ResConfig.screenWidth/30, top: ResConfig.screenWidth/5),
              //padding: authDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Color(0xFF959595),
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back, color: Color(0XFF393C7A),)),
                  SizedBox(height: ResConfig.screenHeight / 20,),
                  Text('Verify your Phone\nNumber', style: GoogleFonts.poppins(color: Color(0xFF393C7A), fontSize: 28, fontWeight: FontWeight.w600),),
                  SizedBox(height: ResConfig.screenHeight / 20,),
                  Text('Please enter the 6 digit code sent to', style: GoogleFonts.poppins(color: Color(0xFF333333), fontSize: 16),),
                  SizedBox(height: ResConfig.screenHeight / 30,),
                  Text('+2349087456823', style: GoogleFonts.poppins(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w700),),
                  SizedBox(height: ResConfig.screenHeight / 15,),
                  Image.asset('assets/images/box_image.png'),
                  SizedBox(height: ResConfig.screenHeight / 20,),
                  Row(
                    children: [
                      Text('Resend code in', style: GoogleFonts.poppins(color: Color(0xFF959595), fontSize: 14, fontWeight: FontWeight.w600),),
                      SizedBox(width: 5,),
                      Text('00:30', style: GoogleFonts.poppins(color: Color(0xFF333333), fontSize: 14, 
                      fontWeight: FontWeight.w600),)

                    ],
                  )




                ],
              )
          )
      ),
    );
  }
}
