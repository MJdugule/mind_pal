import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: purpleText,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResConfig.screenWidth / 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose a layout",
                  style: GoogleFonts.poppins(
                      color: purpleText,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 40,
                ),
                Text(
                  "In what format would you like your bucketlist\nto appear?",
                  style: GoogleFonts.poppins(height: 2),
                ),

              ],
            ),
          ), SizedBox(
            height: ResConfig.screenHeight / 25,
          ),
          const Divider(
            color: lightGreyText,
            height: 2,
          ),
          const BucketContent(
              title: "  Pen and paper", image: "assets/images/checked.png"),
          BucketContent(title: "Digital",image: "assets/images/checked.png"),
          SizedBox(
            height: ResConfig.screenHeight / 2.5,
          ),
          GestureDetector(
              onTap: () {},
              child: const Center(
                  child: GetStartedButton(
                      color: Color(0xFF393c7A),
                      text: 'Next',
                      textColor: Color(0xFFFFFFFF))))
        ],
      ),
    );
  }


}