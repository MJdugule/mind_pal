import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_application_1/createPass.dart';

class CreateScreen extends StatefulWidget {
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email address or phone number',
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
                hintText: 'Enter your email address or phone number',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
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
                hintText: 'Enter a username',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildNextBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatePass()));
        },
        padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.indigo[900],
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.grey[350],
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
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
                      vertical: 120,
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image.asset('text.png'),
                          /*Text("Let's help you get",
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900)),
                          Text('started',
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900)),*/
                          SizedBox(height: 100),
                          buildEmail(),
                          SizedBox(height: 50),
                          buildUsername(),
                          SizedBox(height: 80),
                          buildNextBtn(),
                        ])),
              ),
              Positioned(
                top: 80,
                left: 20,
                child: Image.asset('text.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
