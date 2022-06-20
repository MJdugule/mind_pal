import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home/edit_tasks_screen.dart';
import 'colours.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({Key? key, required this.taskCategory, required this.taskTitle, required this.taskTime}) : super(key: key);
  final String taskCategory;
  final String taskTitle;
  final String taskTime;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(taskCategory, style: GoogleFonts.poppins(color: lightPurpleText, fontSize: 16, fontWeight: FontWeight.w600)),
    SizedBox(height: 10,),
    Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(taskTitle, style: GoogleFonts.poppins(color: taskDarkText, fontSize: 15,  fontWeight: FontWeight.w500),),
      Spacer(),

      Image.asset('assets/icons/bell-ring-outline.png'),

      Image.asset('assets/icons/checked.png'),
    ],
    ),

      Text(taskTime, style: GoogleFonts.poppins(color: menuText, fontSize: 13, fontWeight: FontWeight.w600),),
    Align(
    alignment: Alignment.bottomRight,
    child: InkWell(
        highlightColor: Colors.blue.withOpacity(0.4),

        splashColor: Colors.purple.shade100,
      onTap: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => EditTasksScreen(taskCategory: taskCategory, taskTitle: taskTitle,)));
      },
        child: Text('Edit', style: GoogleFonts.poppins(color: purpleText, fontSize: 14, fontWeight: FontWeight.w700),)))
    ],
    ))] );
  }
}
