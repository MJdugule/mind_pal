import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/res_config.dart';

import '../../services/database_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(16.0),
                height: ResConfig.screenHeight / 3,
                child: Image.asset('assets/images/login_welcome.png')),
            const Text('Email address or username'),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  hintText: 'Enter your email address or username'),
            ),
            const SizedBox(height: 20),
            const Text('Password'),
            TextFormField(
              controller: _password,
              decoration:
                  const InputDecoration(hintText: 'Enter your password'),
            ),
            Center(
              child: isLoading && _password.text.isNotEmpty
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (_password.text.isNotEmpty &&
                            _email.text.isNotEmpty) {
                          var data = {
                            "email": _email.text.trim(),
                            "password": _password.text.trim(),
                          };
                          var res =
                              await TaskApi().postTask(data, 'user/login');
                          var body = jsonDecode(res.body);

                          if (res.statusCode == 200) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Wrong Details: '
                                    '${body['message']}'),
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
                                  'email or password cannot be empty'),
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
                      child: const Text('Login')),
            ),
            Row(
              children: const [
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
                const Text('New around here? '),
                InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupEmailScreen()));
                    },
                    child: const Text('Create an account')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
