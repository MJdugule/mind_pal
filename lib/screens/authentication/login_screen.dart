import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/signup_email.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/res_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
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
              decoration: const InputDecoration(
                  hintText: 'Enter your email address or username'),
            ),
            const SizedBox(height: 20),
            const Text('Password'),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Enter your password'),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
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
                    onTap: () {
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
