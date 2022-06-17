import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_application_1/createScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email address or username',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                /*prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff417dc1),
                ),*/
                hintText: 'Enter your email address or username',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                /*prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff417dc1),
                ),*/
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Login Pressed'),
        padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.indigo[900],
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.grey[350],
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateScreen()));
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'New around here?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              )),
          TextSpan(
              text: ' Create an account',
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xffffffff),
                      Color(0xffffffff),
                      Color(0xffffffff),
                      Color(0xffffffff)
                    ])),
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'Group26911.png',
                        ),
                        SizedBox(height: 50),
                        buildEmail(),
                        SizedBox(height: 30),
                        buildPassword(),
                        SizedBox(height: 77),
                        buildLoginBtn(),
                        buildSignUpBtn(),
                      ],
                    )),
              ),
              Positioned(
                top: 480,
                left: 100,
                width: 900,
                height: 100,
                child: Image.asset('Line1.png'),
              ),
              Positioned(
                top: 480,
                left: 190,
                right: 190,
                child: Image.asset('Orcontinuewith.png'),
              ),
              Positioned(
                top: 480,
                right: 100,
                width: 900,
                height: 100,
                child: Image.asset('Line2.png'),
              ),
              Positioned(
                top: 510,
                left: 165,
                width: 900,
                height: 100,
                child: Image.asset('Google.png'),
              ),
              Positioned(
                top: 510,
                left: 235,
                width: 900,
                height: 100,
                child: Image.asset('facebook.png'),
              ),
              Positioned(
                top: 510,
                left: 305,
                width: 900,
                height: 100,
                child: Image.asset('apple.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
