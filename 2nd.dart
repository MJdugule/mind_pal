import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screens_application_1/Shared.dart';
import 'package:screens_application_1/category.dart';

class LabelSpace extends StatefulWidget {
  @override
  State<LabelSpace> createState() => _LabelSpaceState();
}

class _LabelSpaceState extends State<LabelSpace> {
  Widget buildLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(-8, 20, 0, 20),
                hintText: 'Give a label to your shared space...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildDescrip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(-8, 20, 0, 20),
                hintText: 'Briefly state the overall purpose of your group...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
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
              context, MaterialPageRoute(builder: (context) => Category()));
        },
        padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                          SizedBox(height: 210),
                          buildLabel(),
                          SizedBox(height: 75),
                          buildDescrip(),
                          SizedBox(height: 150),
                          buildNextBtn(),
                        ]),
                  )),
              Positioned(
                child: Image.asset('back.png'),
                top: 10,
                left: 10,
              ),
              Positioned(
                child: FlatButton(
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Colors.indigo[800],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Shared()));
                  },
                ),
                top: 15,
                left: -20,
              ),
              Positioned(
                child: Image.asset('Label.png'),
                top: 70,
                left: 20,
              ),
              Positioned(
                child: Image.asset('ex.png'),
                top: 130,
                left: 20,
              ),
              Positioned(
                child: Image.asset('AddLabel.png'),
                top: 210,
                left: 20,
              ),
              Positioned(
                child: Image.asset('adddescrip.png'),
                top: 340,
                left: 20,
              ),
            ])))))]);
  }
}
