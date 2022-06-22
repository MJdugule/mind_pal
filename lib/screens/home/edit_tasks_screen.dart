import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/alltasks.dart';
import 'package:mind_pal/screens/home/saved.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

import '../../shared_constants/colours.dart';
import '../../shared_constants/res_config.dart';

class EditTasksScreen extends StatefulWidget {
  const EditTasksScreen(
      {Key? key, required this.taskCategory, required this.taskTitle})
      : super(key: key);
  final String taskCategory;
  final String taskTitle;

  @override
  State<EditTasksScreen> createState() => _EditTasksScreenState();
}

class _EditTasksScreenState extends State<EditTasksScreen> {
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: ResConfig.screenWidth / 13,
            top: ResConfig.screenWidth / 5,
            right: ResConfig.screenWidth / 23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: purpleText)),
              SizedBox(
                height: ResConfig.screenWidth / 20,
              ),
              Text(
                'Edit Task',
                style: GoogleFonts.poppins(
                    color: purpleText,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: ResConfig.screenWidth / 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(widget.taskTitle,
                    style: GoogleFonts.poppins(
                        color: menuText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                Image.asset(
                  'assets/icons/delete.png',
                  height: 20,
                ),
              ]),
              SizedBox(
                height: ResConfig.screenWidth / 10,
              ),
              Row(
                children: [
                  Text(
                    widget.taskCategory,
                    style: GoogleFonts.poppins(
                        color: purpleText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: purpleText,
                  )
                ],
              ),
              SizedBox(
                height: ResConfig.screenHeight / 15,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/Group 2.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Send Abel final designs for review',
                    style: GoogleFonts.poppins(
                        color: lightGreyText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/Icon Artwork.png',
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Thu, Jun 30, 2022',
                    style: GoogleFonts.poppins(
                        color: greyText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/clock.png',
                    height: 40,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '14:00 - 15:00',
                    style: GoogleFonts.poppins(
                        color: greyText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  SwitchWidget(),
                ],
              ),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/bell-outline.png',
                    height: 40,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '30 minutes before',
                    style: GoogleFonts.poppins(
                        color: greyText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  SwitchWidget(),
                ],
              ),
              SizedBox(height: ResConfig.screenHeight / 10),
              GestureDetector(
                  onTap: () {
                      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  SavedScreen()));
                  },
                  child: Center(
                      child: GetStartedButton(
                          color: Color(0xFF393c7A),
                          text: 'Save changes',
                          textColor: Color(0xFFFFFFFF))))
            ],
          ),
        ),
      ),
    );
  }
}
