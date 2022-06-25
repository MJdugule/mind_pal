import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/bucket_list/section.dart';
import 'package:mind_pal/screens/home/shared_tasks/category.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class LabelSpace extends StatefulWidget {
  const LabelSpace({Key? key}) : super(key: key);

  @override
  State<LabelSpace> createState() => _LabelSpaceState();
}

class _LabelSpaceState extends State<LabelSpace> {
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
                "Label your spcae",
                style: GoogleFonts.poppins(
                    color: purpleText,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 50,
              ),
              Text(
                "This could be the name of your department, an event, or even just a fun group tag.",
                style:
                    GoogleFonts.poppins(height: 2, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 30,
              ),
              Text(
                "Add Label",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Give a label to your shared space...",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 15,
              ),
              Text(
                "Add desription (Optional)",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Briefly state the overall purpose of your group...",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 4,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Category()),
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
