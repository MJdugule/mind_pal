import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/menu.dart';
import 'package:mind_pal/shared_constants/components.dart';

import '../../shared_constants/colours.dart';
import '../../shared_constants/res_config.dart';

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({Key? key}) : super(key: key);

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  List tasks = [
    const TaskComponent(
        taskCategory: 'Personal',
        taskTitle: 'Do Chores',
        taskTime: '09:00 - 10:30'),
    const TaskComponent(
        taskCategory: 'Personal',
        taskTitle: 'Buy Groceries',
        taskTime: '11:00 - 12:00'),
    const TaskComponent(
        taskCategory: 'Work',
        taskTitle: 'Respond to Emails',
        taskTime: '14:00 - 15:00'),
  ];

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Tasks',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: purpleText,
            fontSize: 25,
          ),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/icons/back.png'),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ResConfig.screenWidth / 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ResConfig.screenHeight / 30),
            Text(
              'Everything you need to do in one place',
              style: GoogleFonts.poppins(
                  color: greyText, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: ResConfig.screenHeight / 30),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/icons/Icon Artwork.png'),
                ),
                Text('June 30, 2022',
                    style: GoogleFonts.poppins(
                        color: menuText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                const Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/filter-variant.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/Group 26995.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/angle-down.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ]),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ResConfig.screenHeight / 30),
              child: Text(
                'Today',
                style: GoogleFonts.poppins(
                    color: purpleText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: ResConfig.screenHeight / 2,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return tasks[index];
                }),
                itemCount: tasks.length,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: null,
                label: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: purpleText,
                ),
                icon: Text(
                  'See All',
                  style: GoogleFonts.poppins(
                      color: purpleText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
