import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screens_application_1/labelspace.dart';

class Shared extends StatefulWidget {
  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  Widget buildCreateBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LabelSpace()));
        },
        padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.indigo[900],
        child: Text(
          'Create a task',
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
    return Column(children: [
      Expanded(
          child: Scaffold(
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                      child: Stack(children: [
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 240),
                                Image.asset(
                                  'shared.png',
                                ),
                                SizedBox(height: 20),
                                Image.asset('invite.png'),
                                buildCreateBtn()
                              ]),
                        )),
                    Positioned(
                      child: Image.asset('back.png'),
                      top: 10,
                      left: 10,
                    ),
                    Positioned(
                      child: Image.asset('Welcome.png'),
                      top: 70,
                      left: 20,
                    ),
                    Positioned(
                      child: Image.asset('subtitle.png'),
                      top: 180,
                      left: 20,
                    )
                  ])))))
    ]);
  }
}
