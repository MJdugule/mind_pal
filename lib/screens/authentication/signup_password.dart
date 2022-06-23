import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/email_verification_screen.dart';
import 'package:mind_pal/screens/authentication/getstarted_screen.dart';
import 'package:mind_pal/screens/authentication/phone_verification_screen.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class SignupPasswordScreen extends StatefulWidget {
  const SignupPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  splashColor: Color(0xFF959595),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0XFF393C7A),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Text(
                  'Create a password',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: purpleText,
                  ),
                ),
              ),
              SizedBox(height: ResConfig.screenHeight / 10),
              AuthTextField(
                  header: 'Create a password',
                  hint: 'Enter a unique password',
                  controller: passwordController),
              AuthTextField(
                  header: 'Re-enter password',
                  hint: 'Re-enter your password',
                  controller: repasswordController),
              SizedBox(height: ResConfig.screenHeight / 7),
              const Center(
                child: AuthButton(
                  route: EmailVerificationScreen(),
                  text: 'Next',
                ),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
