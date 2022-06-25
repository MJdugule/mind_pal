import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class ListName extends StatefulWidget {
  const ListName({Key? key}) : super(key: key);

  @override
  State<ListName> createState() => _ListNameState();
}

class _ListNameState extends State<ListName> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResConfig.screenWidth / 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name your list",
                style: GoogleFonts.poppins(
                    color: purpleText,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 50,
              ),
              Text(
                "Want some inspo?\nFego's Big Dreams",
                style: GoogleFonts.poppins(height: 2,fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 30,
              ),
              Text("Add Name", style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Give a name to your list",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 2.5,
              ),
              GestureDetector(
                  onTap: () {},
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