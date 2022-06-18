import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/login_welcome.png'),
          Text('Email address or username'),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your email address or username'),
          ),
          SizedBox(height: 20),
          Text('Password'),
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter your password'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Login')),
          Row(
            children: [
              Expanded(child: Divider()),
              Text('Or continue with'),
              Expanded(child: Divider()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  print('google');
                },
                child: Image.asset('assets/images/google.png'),
              ),
              InkWell(
                onTap: () {
                  print('facebook');
                },
                child: Image.asset('assets/images/facebook.png'),
              ),
              InkWell(
                onTap: () {
                  print('apple');
                },
                child: Image.asset('assets/images/apple.png'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New around here? '),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupEmailScreen()));
                  },
                  child: Text('Create an account')),
            ],
          ),
        ],
      ),
    );
  }
}
