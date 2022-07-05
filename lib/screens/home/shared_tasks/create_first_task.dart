import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/shared_tasks/first_shared_task.dart';
import 'package:mind_pal/screens/home/shared_tasks/shared_congrats.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class CreateFirstTask extends StatelessWidget {
  const CreateFirstTask({Key? key}) : super(key: key);

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
                onTap: () {}, child: Icon(Icons.arrow_back, color: purpleText)),
            SizedBox(height: ResConfig.screenHeight / 40),
            Text(
              'Create First Task',
              style: GoogleFonts.poppins(
                  color: purpleText, fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: ResConfig.screenHeight / 25),
            Text('Add Title',
                style: GoogleFonts.poppins(
                    color: menuText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: ResConfig.screenHeight / 30),
            TextFieldWidget(
              hintText: 'Give a title to your first task...',
            ),
            SizedBox(height: ResConfig.screenHeight / 20),
            Text('Add Description (Optional)',
                style: GoogleFonts.poppins(
                    color: menuText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            TextFieldWidget(hintText: 'Provide some additional information...'),
            SizedBox(height: ResConfig.screenHeight / 30),
            Text('Members',
                style: GoogleFonts.poppins(
                    color: menuText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: ResConfig.screenHeight / 70),
            Row(
              children: [
                buildMembersContainer('assets/images/barth.jpg'),
                const SizedBox(
                  width: 10,
                ),
                buildMembersContainer('assets/images/matt.jpg'),
                const SizedBox(
                  width: 10,
                ),
                buildMembersContainer('assets/images/steve.jpg'),
                const SizedBox(
                  width: 10,
                ),
                buildMembersContainer('assets/images/tess.jpg'),
                const SizedBox(
                  width: 10,
                ),
                buildMembersContainer('assets/images/olivia.jpg'),
                Spacer(),
                InkWell(
                    splashColor: Colors.purple.shade100,
                    onTap: () {},
                    child: Icon(
                      Icons.add_circle_outline,
                      color: lightPurpleText,
                    )),
              ],
            ),
            SizedBox(height: ResConfig.screenHeight / 60),
            Divider(),
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
                  'June 30 - July 4, 2022',
                  style: GoogleFonts.poppins(
                      color: greyText,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: ResConfig.screenWidth / 10),
            Divider(),
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
                  'All day',
                  style: GoogleFonts.poppins(
                      color: greyText,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                SwitchWidget(),
              ],
            ),
            Divider(),
            SizedBox(height: ResConfig.screenWidth / 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/bell-outline.png',
                  height: 40,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Reminder',
                  style: GoogleFonts.poppins(
                      color: greyText,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                SwitchWidget(),
              ],
            ),
            Divider(),
            SizedBox(height: ResConfig.screenHeight / 40),
            Center(
              child: Container(
                width: 268,
                height: 57,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: purpleText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(4)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstSharedTask()));
                  },
                  child: Text('Create Task',
                      style: GoogleFonts.poppins(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
