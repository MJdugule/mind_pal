import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/screens/authentication/signup_password.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class SignupEmailScreen extends StatefulWidget {
  const SignupEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Text(
                  'Let\'s help you get started',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: purpleText,
                  ),
                ),
              ),
              SizedBox(height: ResConfig.screenHeight / 10),
              AuthTextField(
                  header: 'Email address or phone number',
                  hint: 'Enter your email address or phone number',
                  controller: emailController),
              AuthTextField(
                  header: 'Username',
                  hint: 'Enter a username',
                  controller: usernameController),
              SizedBox(height: ResConfig.screenHeight / 7),
              const Center(
                child: AuthButton(
                  route: SignupPasswordScreen(),
                  text: 'Next',
                ),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: blackText),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: purpleText),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
