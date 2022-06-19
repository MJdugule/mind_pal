import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/services/database_service.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create New Task',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: purpleText,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 17,
                ),
                Text(
                  'Add Title',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 35,
                ),
                Text(
                  'Give a name to your task...',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: greyText,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 35,
                ),
              ],
            ),
          ),
          TextFormField(
            controller: taskController,
            enabled: true,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('data'),
              TextButton(
                onPressed: () {
                  _createTask();
                },
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff454893)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

   _createTask() async {
    var data = {
       "user_id":"4",
      'todo': taskController.text,
    };

    var res = await TaskApi().postTask(data, 'task');
    var body = jsonDecode(res.body);
    if(res==200){
      print('successful');
    } else{
      print('no');
    }
  }
}
