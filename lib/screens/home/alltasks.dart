import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/components.dart';

import '../../shared_constants/colours.dart';
import '../../shared_constants/res_config.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({Key? key}) : super(key: key);

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
              Row(
                children: [
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back, color: purpleText)),
                  SizedBox(width: ResConfig.screenWidth / 20),

                  Text('All Tasks', style: GoogleFonts.poppins(color: purpleText, fontSize: 30, fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(height: ResConfig.screenHeight / 30),
              Text('Everything you need to do in one place', style: GoogleFonts.poppins(color: greyText, fontSize: 14, fontWeight: FontWeight.w600),),
              SizedBox(height: ResConfig.screenHeight / 15),
              Row(
                children: [
                  Image.asset('assets/icons/Icon Artwork.png'),
                  SizedBox(width: ResConfig.screenWidth / 35),

                  Text('June 30, 2022', style: GoogleFonts.poppins(color: menuText, fontSize: 15, fontWeight: FontWeight.w600)),
                  SizedBox(width: ResConfig.screenWidth / 8),

                  Image.asset('assets/icons/filter-variant.png', height: 30,width: 30,),
                  SizedBox(width: 20,),

                  Image.asset('assets/icons/Group 26995.png',height: 30,width: 30,),
                  SizedBox(width: 25,),

                  Image.asset('assets/icons/angle-down.png',height: 30,width: 30,),
                ]
              ),
              SizedBox(height: ResConfig.screenHeight / 25),
              Text('Today', style: GoogleFonts.poppins(color: purpleText, fontSize: 18, fontWeight: FontWeight.w700),),
              SizedBox(height: ResConfig.screenHeight / 25,),
              TaskComponent(taskCategory: 'Personal', taskTitle: 'Do Chores', taskTime: '09:00 - 10:30'),
              SizedBox(height: ResConfig.screenHeight / 25,),

              TaskComponent(taskCategory: 'Personal', taskTitle: 'Buy Groceries', taskTime: '11:00 - 12:00'),
              SizedBox(height: ResConfig.screenHeight / 25,),

              TaskComponent(taskCategory: 'Work', taskTitle: 'Respond to Emails', taskTime: '14:00 - 15:00'),
              SizedBox(height: ResConfig.screenHeight / 25,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                    onPressed: null,
                    label: Icon(Icons.keyboard_arrow_down_rounded, color: purpleText,),
                    icon: Text('See All', style: GoogleFonts.poppins(color: purpleText, fontSize: 14, fontWeight: FontWeight.w700),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
