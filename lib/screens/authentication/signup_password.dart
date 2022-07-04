import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/email_verification_screen.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';

import '../../services/database_service.dart';
import 'signup_email.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

import '../../services/database_service.dart';

class SignupPasswordScreen extends StatefulWidget {
  const SignupPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;

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
                InkWell(
                  splashColor: const Color(0xFF959595),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0XFF393C7A),
                  ),
                ),
                SizedBox(height: ResConfig.screenHeight / 10),
                AuthTextField(
                  header: 'Create a password',
                  hint: 'Enter a unique password',
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  isHidden: true,
                ),
                AuthTextField(
                  keyboardType: TextInputType.visiblePassword,
                  isHidden: true,
                  header: 'Re-enter password',
                  hint: 'Re-enter your password',
                  controller: confirmPassword,
                ),
                SizedBox(height: ResConfig.screenHeight / 7),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: purpleText,
                      ))
                    : Center(
                        child: AuthButton(
                          onTapped: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (password.text == confirmPassword.text) {
                              if (password.text.length >= 6) {
                                var data = {
                                  "username": username.text,
                                  'email': email.text,
                                  'password': password.text,
                                };
                                var res = await TaskApi()
                                    .postTask(data, 'user/register');
                                var body = jsonDecode(res.body);

                                if (res.statusCode == 200) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EmailVerificationScreen() //HomeScreen(),
                                        ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content: const Text(
                                        'Oh something went wrong\nPls check your connection and try again',
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
                                      'The length of password must be more than 6',
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
                                    'Password do not match',
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
                            setState(() {
                              isLoading = false;
                            });
                          },
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
      ),
    );
  }
}
