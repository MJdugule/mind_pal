import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/email_verification_screen.dart';
import 'package:mind_pal/screens/authentication/phone_verification_screen.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/screens/on_boarding.dart';

import '../../services/database_service.dart';
import 'signup_email.dart';

class SignupPasswordScreen extends StatefulWidget {
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Color(0xFF959595),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0XFF393C7A),
                  ),
                ),
                Text('Create a password'),
                SizedBox(height: 20),
                Text('Create password'),
                TextFormField(
                  controller: password,
                  decoration:
                      InputDecoration(hintText: 'Enter a unique password'),
                ),
                SizedBox(height: 20),
                Text('Re-enter password'),
                TextFormField(
                  controller: confirmPassword,
                  decoration:
                      InputDecoration(hintText: 'Re-enter your password'),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () async {
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
                          var res =
                              await TaskApi().postTask(data, 'user/register');
                          var body = jsonDecode(res.body);

                          if (res.statusCode == 200) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    'Oh something went wrong\nPls check your connection and try again'),
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
                              content: const Text(
                                  'The length of password must be more than 6'),
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
                            content: const Text('Password do not match'),
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
                    child: const Text('Next')),
              ],
            ),
    );
  }
}
