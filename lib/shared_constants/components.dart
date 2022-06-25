import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/edit_tasks_screen.dart';
import 'package:mind_pal/shared_constants/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'colours.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent(
      {Key? key,
      required this.taskCategory,
      required this.taskTitle,
      required this.taskTime})
      : super(key: key);
  final String taskCategory;
  final String taskTitle;
  final String taskTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(taskCategory,
            style: GoogleFonts.poppins(
                color: lightPurpleText,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ResConfig.screenWidth / 1.6,
                    child: Text(
                      taskTitle,
                      style: GoogleFonts.poppins(
                          color: taskDarkText,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Spacer(),
                  Image.asset('assets/icons/bell-ring-outline.png'),
                  Image.asset('assets/icons/checked.png'),
                ],
              ),
              Text(
                taskTime,
                style: GoogleFonts.poppins(
                    color: menuText, fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  highlightColor: Colors.blue.withOpacity(0.4),
                  splashColor: Colors.purple.shade100,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditTasksScreen(
                                  taskCategory: taskCategory,
                                  taskTitle: taskTitle,
                                )));
                  },
                  child: Text(
                    'Edit',
                    style: GoogleFonts.poppins(
                        color: purpleText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: ResConfig.screenHeight / 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FirstSharedTaskComponent extends StatelessWidget {
  const FirstSharedTaskComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, right: 5),
      width: 361,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFFF6F5F5),
          width: 3,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Design Thinking', style: GoogleFonts.poppins(fontSize: 16,color: taskDarkText,fontWeight: FontWeight.w600),),
                CircularPercentIndicator(
                    radius: 20,
                  lineWidth: 2,
                  animation: false,
                  percent: 0.0,
                  center: Text('0%', style: GoogleFonts.poppins(color: Color(0xFF525252),fontSize: 14, fontWeight: FontWeight.w500),),
                  progressColor: lightPurpleText,
                  backgroundColor: Colors.grey.shade300,
                  circularStrokeCap: CircularStrokeCap.round,
                )
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Discussing details of the Bar\nproject', style: GoogleFonts.poppins(fontSize: 12, color: lightGreyText),),
                  SizedBox(width: 15,),
                  buildMembersContainer('assets/images/barth.jpg'),
                  const SizedBox(width: 1,),
                  buildMembersContainer('assets/images/matt.jpg'),
                  const SizedBox(width: 1,),
                  buildMembersContainer('assets/images/steve.jpg'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
