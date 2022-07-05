import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/shared_tasks/shared_congrats.dart';
import 'package:mind_pal/shared_constants/components.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class FirstSharedTask extends StatelessWidget {
  const FirstSharedTask({Key? key}) : super(key: key);

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
              onTap: () {}, child: Icon(Icons.arrow_back, color: purpleText)),
          SizedBox(height: ResConfig.screenHeight / 30),
          Text(
            'Take a look at your first\nshared task',
            style: GoogleFonts.poppins(
                color: purpleText, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: ResConfig.screenHeight / 30),
          Text(
              'You\'ll be able to get a clear view anytime\nyou click on the "Shared Tasks" feature',
              style: GoogleFonts.poppins(
                  color: greyText, fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(height: ResConfig.screenHeight / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hub House Team',
                  style: GoogleFonts.poppins(
                      color: purpleText,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              Container(
                  height: 30,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: activeSwitchColor,
                  ),
                  child: Center(
                      child: Text(
                    '5d',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800),
                  )))
            ],
          ),
          SizedBox(height: ResConfig.screenHeight / 60),
          FirstSharedTaskComponent(),
          Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                  highlightColor: Colors.blue.withOpacity(0.4),
                  splashColor: Colors.purple.shade100,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SharedCongrats()));
                  },
                  child: Text(
                    'Edit',
                    style: GoogleFonts.poppins(
                        color: purpleText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ))),
          SizedBox(height: ResConfig.screenHeight / 5),
          Align(
              alignment: Alignment.bottomCenter,
              child: const FeatureButtonBlue(
                  route: SharedCongrats(), text: 'Next')),
        ]),
      ),
    ));
  }
}
