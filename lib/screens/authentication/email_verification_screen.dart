import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/authentication/getstarted_screen.dart';
import '../../shared_constants/res_config.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()));
  }

  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                  left: ResConfig.screenWidth / 13,
                  right: ResConfig.screenWidth / 30,
                  top: ResConfig.screenWidth / 5),
              //padding: authDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      splashColor: const Color(0xFF959595),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0XFF393C7A),
                      )),
                  SizedBox(
                    height: ResConfig.screenHeight / 20,
                  ),
                  Text(
                    'Verify your Email',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF393C7A),
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: ResConfig.screenHeight / 20,
                  ),
                  Text(
                    'Please enter the 6 digit code sent to',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF333333), fontSize: 16),
                  ),
                  SizedBox(
                    height: ResConfig.screenHeight / 30,
                  ),
                  Text(
                    'sashaoghenefego19@gmail.com',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: ResConfig.screenHeight / 15,
                  ),
                  Image.asset('assets/images/box_image.png'),
                  SizedBox(
                    height: ResConfig.screenHeight / 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Resend code in',
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF959595),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '00:30',
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF333333),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
