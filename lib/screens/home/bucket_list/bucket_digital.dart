
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/bucket_list/bucket_congrats.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class BucketDigital extends StatefulWidget {
  const BucketDigital({Key? key}) : super(key: key);

  @override
  State<BucketDigital> createState() => _BucketDigitalState();
}

class _BucketDigitalState extends State<BucketDigital> {
  List bucketLists = [
    const DigitalTaskBox(text: 'Visit Rome'),
    const DigitalTaskBox(text: 'Learn to bake'),
    const DigitalTaskBox(text: 'Move to study in paris'),
    const DigitalTaskBox(text: 'Attend a folk concert'),
    const DigitalTaskBox(text: 'Visit Rome'),
    const DigitalTaskBox(text: 'Learn to bake'),
    const DigitalTaskBox(text: 'Move to study in paris'),
    const DigitalTaskBox(text: 'Attend a folk concert'),
  ];

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/icons/back.png'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Digital',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: purpleText,
                ),
              ),
              Text(
                'Here\'s a glimpse of what your list currently looks like. You can add, update, or delete goals anytime.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: lightGreyText,
                ),
              ),
              Container(
                color: digitalBox,
                child: Column(
                  children: [
                    Text(
                      'Fego\'s goals',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: goalHeadertext,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: ResConfig.screenHeight / 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return bucketLists[index];
                        }),
                        itemCount: bucketLists.length,
                      ),
                    ),
                    SizedBox(
                      height: ResConfig.blockSizeVertical * 3,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const FeatureButtonWhite(
                      route: BucketCongrats(),
                      text: 'Edit',
                    ),
                    SizedBox(
                      height: ResConfig.blockSizeVertical * 2,
                    ),
                    const FeatureButtonBlue(
                      route: BucketCongrats(),
                      text: 'Confirm',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
