import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/signup_password.dart';

class SignupEmailScreen extends StatefulWidget {
  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Let\'s help you get started'),
          SizedBox(height: 20),
          Text('Email address or phone number'),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your email address or phone number'),
          ),
          SizedBox(height: 20),
          Text('Username'),
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter a username'),
          ),
          SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignupPasswordScreen()));
              },
              child: Text('Next')),
        ],
      ),
    );
  }
}
