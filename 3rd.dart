import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screens_application_1/invitemembers.dart';

import 'labelspace.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Widget buildCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              hintText: 'Enter a category...',
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black38,
              ),
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
          ),
        )
      ],
    );
  }

  Widget buildNextBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Invite()));
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

  Widget buildSkipBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          /*Navigator.push(
              context, MaterialPageRoute(builder: (context) => LabelSpace()));*/
        },
        padding: EdgeInsets.fromLTRB(125, 17, 125, 17),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black),
        ),
        color: Colors.white,
        child: Text(
          'Skip',
          style: TextStyle(
            color: Colors.black38,
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
                        children: [
                          SizedBox(height: 235),
                          buildCategory(),
                          SizedBox(height: 180),
                          buildSkipBtn(),
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
                        MaterialPageRoute(builder: (context) => LabelSpace()));
                  },
                ),
                top: 15,
                left: -20,
              ),
              Positioned(
                child: Image.asset('Category.png'),
                top: 70,
                left: 25,
              ),
              Positioned(
                child: Image.asset('friends.png'),
                top: 120,
                left: 25,
              ),
              Positioned(
                child: Image.asset('Addcategory.png'),
                top: 230,
                left: 30,
              ),
            ])))))]);
  }
}
