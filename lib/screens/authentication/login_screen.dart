import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: ResConfig.screenHeight / 3,
                    child: Image.asset('assets/images/login_welcome.png')),
              ),
              AuthTextField(
                header: 'Email address or username',
                hint: 'Enter your email address or username',
                controller: emailController,
              ),
              AuthTextField(
                header: 'Password',
                hint: 'Enter your password',
                controller: passwordController,
              ),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              Row(
                children: const [
                  Expanded(
                      child: Divider(
                    color: dividerColor,
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: blackText),
                    ),
                  ),
                  Expanded(child: Divider(color: dividerColor)),
                ],
              ),
              SizedBox(
                height: ResConfig.screenHeight / 30,
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
              SizedBox(
                height: ResConfig.screenHeight / 30,
              ),
              const Center(
                  child: AuthButton(
                route: HomeScreen(),
                text: 'Login',
              )),
              SizedBox(
                height: ResConfig.screenHeight / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New around here? ',
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
                                builder: (context) => SignupEmailScreen()));
                      },
                      child: const Text(
                        'Create an account',
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
