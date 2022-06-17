import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_application_1/createScreen.dart';

class CreatePass extends StatefulWidget {
  @override
  State<CreatePass> createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create password',
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
                hintText: 'Enter a unique password',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildRenterPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Re-enter password',
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
                hintText: 'Re-enter your password',
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
        onPressed: () => print('Login Pressed'),
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
                    child: Column(mainAxisAlignment: MainAxisAlignment.end,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image.asset('passtext.png'),
                          /*Text('started',
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900)),*/
                          SizedBox(height: 80),
                          buildPassword(),
                          SizedBox(height: 50),
                          buildRenterPassword(),
                          SizedBox(height: 80),
                          buildNextBtn(),
                        ])),
              ),
              Positioned(
                top: 30,
                left: -10,
                child: RaisedButton(
                    elevation: 0,
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateScreen()));
                    }),
              ),
              Positioned(
                top: 25,
                left: 10,
                child: Image.asset('back.png'),
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Image.asset('passtext.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
