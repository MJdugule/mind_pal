import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/bucket_list/layout.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/screens/home/shared_tasks/create_first_task.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class InviteMembers extends StatefulWidget {
  const InviteMembers({Key? key}) : super(key: key);

  @override
  State<InviteMembers> createState() => _InviteMembersState();
}

class _InviteMembersState extends State<InviteMembers> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResConfig.screenWidth / 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invite Members",
                style: GoogleFonts.poppins(
                    color: purpleText,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 40,
              ),
              Text(
                "Invite members of your group to the shared space so they can join in!",
                style:
                    GoogleFonts.poppins(height: 2, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              TextField(
                  decoration: InputDecoration(
                      suffixIcon: TextButton.icon(
                        onPressed: null,
                        label: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: purpleText,
                        ),
                        icon: Text(
                          'As admin',
                          style: GoogleFonts.poppins(
                              color: blackText,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      hintText: "Enter email adress",
                      hintStyle: GoogleFonts.poppins(
                          color: textFieldTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: taskDarkText, width: 3),
                      ))),
              SizedBox(
                height: ResConfig.screenHeight / 4,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: const Center(
                      child: GetStartedButton(
                          color: Color(0xFFFFFFFF),
                          text: "I'll ride solo for now",
                          textColor: textFieldTextColor))),
              SizedBox(
                height: ResConfig.screenHeight / 40,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateFirstTask()),
                    );
                  },
                  child: const Center(
                      child: GetStartedButton(
                          color: Color(0xFF393c7A),
                          text: "Next",
                          textColor: Color(0xFFFFFFFF))))
            ],
          ),
        ),
      ),
    );
  }
}
