import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/success.dart';
import 'package:mind_pal/services/database_service.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String category = 'Category';

  TextEditingController taskController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var categories = [
    'Category',
    'Personal',
    'Work',
    'Group',
  ];

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    DateTime selectedDate = DateTime.now();

    Future<Null> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

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
        body: SingleChildScrollView(
          child: Column(
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
                    SizedBox(
                      width: ResConfig.screenWidth / 1.1,
                      child: TextFormField(
                        controller: taskController,
                        enabled: true,
                        maxLength: 30,
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
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: category,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: purpleText,
                        ),
                        items: categories.map((String categories) {
                          return DropdownMenuItem(
                            value: categories,
                            child: Text(categories),
                          );
                        }).toList(),
                        onChanged: (String? newCategory) {
                          setState(() {
                            category = newCategory!;
                          });
                        },
                        style: GoogleFonts.poppins(
                            color: blackText,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: ResConfig.screenWidth / 1.1,
                      child: TextFormField(
                        controller: notesController,
                        maxLines: null,
                        maxLength: 100,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/icons/Group 2.png',
                            color: lightPurpleText,
                          ),
                          border: InputBorder.none,
                          hintText: 'Add notes',
                          hintStyle: GoogleFonts.poppins(
                              color: blackText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Image.asset(
                              'assets/icons/Icon Artwork.png',
                              height: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Text(
                              "${selectedDate}".split(' ')[0],
                              style: GoogleFonts.poppins(
                                  color: blackText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/clock.png',
                            height: 40,
                          ),
                        ),
                        Text(
                          'All day',
                          style: GoogleFonts.poppins(
                              color: blackText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        SwitchWidget(),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/bell-outline.png',
                            height: 40,
                          ),
                        ),
                        Text(
                          'Reminder',
                          style: GoogleFonts.poppins(
                              color: blackText,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        SwitchWidget(),
                      ],
                    ),
                    SizedBox(height: ResConfig.screenHeight / 30),
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
                          backgroundColor:
                              MaterialStateProperty.all(purpleText),
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
          ),
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
