import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Lists",
          style: GoogleFonts.poppins(
              color: purpleText, fontSize: 23, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
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
              horizontal: ResConfig.screenWidth / 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ResConfig.screenHeight / 40,
                ),
                Container(
                  width: 450,
                  height: 80,
                  decoration: BoxDecoration(
                      color: purpleText,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResConfig.screenWidth / 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bucket List",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        Image.asset("assets/images/Vectors.png")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ResConfig.screenHeight / 40,
                ),
                Container(
                  width: 450,
                  height: 80,
                  decoration: BoxDecoration(
                      color: redMenuBox,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResConfig.screenWidth / 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Others lists",
                            style: GoogleFonts.poppins(
                                color: taskDarkText,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        Image.asset("assets/images/dot.png")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
