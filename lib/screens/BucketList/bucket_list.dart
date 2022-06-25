import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class BucketList extends StatefulWidget {
  const BucketList({Key? key}) : super(key: key);

  @override
  State<BucketList> createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
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
          onPressed: () {},
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
                  "Bucket List!",
                  style: GoogleFonts.poppins(
                      color: purpleText,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 50,
                ),
                Text(
                  "A safe place for all your dreams and\n aspirations.",
                  style: GoogleFonts.poppins(height: 2),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 50,
                ),
                Image.asset(
                  "assets/images/bucket_welcome.png",
                ),
              ],
            ),
          ),
          SizedBox(
            height: ResConfig.screenHeight / 35,
          ),
          const Divider(
            color: lightGreyText,
            height: 2,
          ),
          const BucketContent(
              title: "Customize your layouts",
              image: "assets/images/checked.png"),
          const BucketContent(
              title: "Section and write down your goals",
              image: "assets/images/checked.png"),
          const BucketContent(
              title: "Update your progress",
              image: "assets/images/checked.png"),
          SizedBox(
            height: ResConfig.screenHeight / 25,
          ),
          GestureDetector(
              onTap: () {},
              child: const Center(
                  child: GetStartedButton(
                      color: Color(0xFF393c7A),
                      text: 'Create a list',
                      textColor: Color(0xFFFFFFFF))))
        ],
      ),
    );
  }
}