import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/bucket_list/layout.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class Section extends StatefulWidget {
  const Section({Key? key}) : super(key: key);

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
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
                "Section",
                style: GoogleFonts.poppins(
                    color: purpleText,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 40,
              ),
              Text(
                "Do these goals have something in common\nWhy not sort them in a section for better\naccountability",
                style:
                    GoogleFonts.poppins(height: 2, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              Text(
                "Add section (Optional)",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: purpleText,
                      ),
                      hintText: "Sort your list into a category",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: taskDarkText, width: 3),
                      ))),
              SizedBox(
                height: ResConfig.screenHeight / 3,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Layout()),
                    );
                  },
                  child: const Center(
                      child: GetStartedButton(
                          color: Color(0xFFFFFFFF),
                          text: "Skip",
                          textColor: textFieldTextColor))),
              SizedBox(
                height: ResConfig.screenHeight / 40,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Layout()),
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
