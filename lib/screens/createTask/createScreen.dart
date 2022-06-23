import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/success.dart';
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New Task',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: purpleText,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: ResConfig.screenHeight / 20,
                  ),
                  Text(
                    'Add Title',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: blackText,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: ResConfig.screenHeight / 60,
                  ),
                  TextFormField(
                    controller: taskController,
                    enabled: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Give a name to your task...',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: greyText,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: ResConfig.screenHeight / 2.3),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        _createTask();
                      },
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 100.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(purpleText),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  _createTask() async {
    var data = {
      "user_id": "4",
      'todo': taskController.text,
    };

    var res = await TaskApi().postTask(data, 'task');
    var body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()));
    } else {
      const SnackBar(content: Text('Uh oh... Something went wrong.'));
    }
  }
}
