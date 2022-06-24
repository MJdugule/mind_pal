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
  final emailController = TextEditingController();
  final usernameController = TextEditingController();

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
