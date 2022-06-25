import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/screens/authentication/signup_password.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

final TextEditingController username = TextEditingController();
final TextEditingController email = TextEditingController();

class SignupEmailScreen extends StatefulWidget {
  const SignupEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                    keyboardType: TextInputType.emailAddress,
                    isHidden: false,
                    controller: email),
                AuthTextField(
                  header: 'Username',
                  hint: 'Enter a username',
                  isHidden: false,
                  keyboardType: TextInputType.name,
                  controller: username,
                ),
                SizedBox(height: ResConfig.screenHeight / 7),
                Center(
                  child: AuthButton(
                    onTapped: () {
                      if (email.text.trim().isNotEmpty) {
                        if (username.text.trim().isNotEmpty) {
                          if (email.text.contains('@')) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignupPasswordScreen(),
                                  //maintainState: true,
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                content: const Text(
                                  'Must contain "@"',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 4,
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              content: const Text(
                                'Username cannot be empty',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 4,
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content: const Text(
                              'Email cannot be empty',

                              textAlign: TextAlign.center,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 4,
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
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
      ),
    );
  }
}
