import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';
import 'package:mind_pal/screens/createTask/createScreen.dart';

class WhatWouldYouLikeToDo extends StatelessWidget {
  const WhatWouldYouLikeToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/icons/back.png'),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            width: ResConfig.screenWidth / 1.5,
            child: const Text(
              'What would you like to do?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: purpleText,
              ),
            ),
          ),
          SizedBox(
            height: ResConfig.screenHeight / 15,
          ),
          Divider(),
          WWYLTDBox(text: 'Create New Task', ontap: CreateTaskScreen()),
          Divider(),
          WWYLTDBox(text: 'Create New To-Do List', ontap: HomeScreen()),
          Divider(),
          WWYLTDBox(text: 'Set Reminder', ontap: HomeScreen()),
          Divider(),
        ],
      ),
    );
  }
}
