import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

import '../../shared_constants/colours.dart';
import '../../shared_constants/res_config.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: ResConfig.screenWidth / 13,
            top: ResConfig.screenWidth / 5, right: ResConfig.screenWidth / 23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(onTap: (){
                Navigator.pop(context);
              },child: Icon(Icons.arrow_back, color: purpleText)),
              SizedBox(height: ResConfig.screenWidth / 30),
              Text('Create New Task', style: GoogleFonts.poppins(color: purpleText, fontSize: 25, fontWeight: FontWeight.w600),),
              SizedBox(height: ResConfig.screenWidth / 10),
              Text('Add Title', style: GoogleFonts.poppins(color: menuText, fontSize: 15, fontWeight: FontWeight.w600)),
              SizedBox(height: ResConfig.screenWidth / 30),
              TextFieldWidget(hintText: 'Give a name to your task',),
              SizedBox(height: ResConfig.screenWidth / 10),
              Row(
                children: [
                  Text('Category', style: GoogleFonts.poppins(color: purpleText, fontSize: 16, fontWeight: FontWeight.w600 ),),
                  Icon(Icons.keyboard_arrow_down_sharp, color: purpleText,)
                ],
              ),
              SizedBox(height: ResConfig.screenWidth / 10),
              Row(
                children: [
                  Image.asset('assets/icons/Group 2.png'),
                  SizedBox(width: 5,),
                  Text('Add notes',style: GoogleFonts.poppins(color: lightGreyText, fontSize: 13, fontWeight: FontWeight.w500 ), ),
                ],
              ),
              SizedBox(height: ResConfig.screenWidth / 10),
              Row(
                children: [
                  Image.asset('assets/icons/Icon Artwork.png', height: 20,),
                  SizedBox(width: 10,),
                  Text('Thu, Jun 30, 2022',style: GoogleFonts.poppins(color: greyText, fontSize: 13, fontWeight: FontWeight.w500 ), ),
                ],
              ),
              SizedBox(height: ResConfig.screenWidth / 10),

              Row(
                children: [
                  Image.asset('assets/icons/clock.png', height: 40,),
                  SizedBox(width: 5,),
                  Text('All day',style: GoogleFonts.poppins(color: greyText, fontSize: 13, fontWeight: FontWeight.w500 ), ),
                  Spacer(),
                  SwitchWidget(),
                ],
              ),
              SizedBox(height: ResConfig.screenWidth / 10),
              Row(
                children: [
                  Image.asset('assets/icons/bell-outline.png', height: 40,),
                  SizedBox(width: 5,),
                  Text('Reminder',style: GoogleFonts.poppins(color: greyText, fontSize: 13, fontWeight: FontWeight.w500 ), ),
                  Spacer(),
                  SwitchWidget(),
                ],
              ),
              SizedBox(height: 50,),
              GestureDetector(
                  onTap: () {

                  },
                  child: Center(child: GetStartedButton(color: Color(0xFF393c7A),
                   text: 'Save', textColor: Color(0xFFFFFFFF))))

            ],
          ),
        ),
      ),
    );
  }
}
