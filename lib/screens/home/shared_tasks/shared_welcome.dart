import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/bucket_list/name_list.dart';
import 'package:mind_pal/screens/home/shared_tasks/label_space.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class SharedTask extends StatefulWidget {
  const SharedTask({Key? key}) : super(key: key);

  @override
  State<SharedTask> createState() => _SharedTaskState();
}

class _SharedTaskState extends State<SharedTask> {
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: purpleText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResConfig.screenWidth / 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to",
                  style: GoogleFonts.poppins(
                      color: purpleText,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Shared Tasks!",
                  style: GoogleFonts.poppins(
                      color: purpleText,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 50,
                ),
                Text(
                  "Succeed together by organizing with family, friends, and colleagues.",
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 50,
                ),
                Center(
                  child: Container(
                    height: ResConfig.screenHeight / 3,
                    child: Image.asset(
                      "assets/images/shared_welcome.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ResConfig.screenHeight / 35,
          ),
          const Divider(),
          const SharedContent(
              title: "Invite team members", image: "assets/images/checked.png"),
          const SharedContent(
              title: "Assign tasks and schedule events",
              image: "assets/images/checked.png"),
          const SharedContent(
              title: "Monitor collective progress",
              image: "assets/images/checked.png"),
          SizedBox(
            height: ResConfig.screenHeight / 50,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LabelSpace()),
                );
              },
              child: const Center(
                  child: GetStartedButton(
                      color: Color(0xFF393c7A),
                      text: 'Create a task',
                      textColor: Color(0xFFFFFFFF))))
        ],
      ),
    );
  }
}
