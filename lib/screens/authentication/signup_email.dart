import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/signup_password.dart';

final TextEditingController username = TextEditingController();
final TextEditingController email = TextEditingController();

class SignupEmailScreen extends StatefulWidget {
  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Let\'s help you get started'),
          SizedBox(height: 20),
          Text('Email address or phone number'),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
                hintText: 'Enter your email address or phone number'),
          ),
          SizedBox(height: 20),
          Text('Username'),
          TextFormField(
            controller: username,
            decoration: InputDecoration(hintText: 'Enter a username'),
          ),
          SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPasswordScreen(),
                      //maintainState: true,
                    ));
              },
              child: Text('Next')),
        ],
      ),
    );
  }
}
