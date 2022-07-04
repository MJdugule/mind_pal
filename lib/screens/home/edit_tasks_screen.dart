import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/saved.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

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
      appBar: AppBar(
        title: Text(
          'Edit Task',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: purpleText,
            fontSize: 25,
          ),
        ),
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: ResConfig.screenWidth / 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ResConfig.screenWidth / 1.3,
                    child: Text(widget.taskTitle,
                        style: GoogleFonts.poppins(
                            color: menuText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/delete.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
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
                  const Icon(
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
                height: ResConfig.screenHeight / 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/Icon Artwork.png',
                      height: 20,
                    ),
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
                height: ResConfig.screenHeight / 30,
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
                height: ResConfig.screenHeight / 30,
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SavedScreen()));
                  },
                  child: const Center(
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
