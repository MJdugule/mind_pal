import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/email_verification_screen.dart';
import 'package:mind_pal/screens/authentication/phone_verification_screen.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';

class SignupPasswordScreen extends StatefulWidget {
  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            splashColor: Color(0xFF959595),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0XFF393C7A),
            ),
          ),
          Text('Create a password'),
          SizedBox(height: 20),
          Text('Create password'),
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter a unique password'),
          ),
          SizedBox(height: 20),
          Text('Re-enter password'),
          TextFormField(
            decoration: InputDecoration(hintText: 'Re-enter your password'),
          ),
          SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Next')),
        ],
      ),
    );
  }
}
