import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/menu.dart';
import 'package:mind_pal/shared_constants/components.dart';

import '../../services/database_service.dart';
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
        taskTitle: 'Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores Do Chores ',
        taskTime: '09:00 - 10:30'),
    const TaskComponent(
        taskCategory: 'Personal',
        taskTitle: 'Buy Groceries',
        taskTime: '11:00 - 13:00'),
    const TaskComponent(
        taskCategory: 'Work',
        taskTitle: 'Respond to Emails',
        taskTime: '14:00 - 15:00'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getAllTask() async {
    var res = await TaskApi().getTask('task/');
    var data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Task loaded Successfully',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: purpleText,
              fontSize: 20,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          backgroundColor: Colors.grey.shade400,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Pls Check Your Network COnnection',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: purpleText,
              fontSize: 20,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          backgroundColor: Colors.red,
        ),
      );
    }

    List<UserData> taskData = [];

    for (var d in data) {
      UserData userTask = UserData(
        id: d['id'],
        userId: d['user_id'],
        todo: d['todo'],
        status: d['status'],
        createdOn: d['created_on'],
      );
      taskData.add(userTask);
    }

    return taskData;
  }

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
              child: FutureBuilder(
                future: getAllTask(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: purpleText,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Data Loading',
                          style: GoogleFonts.poppins(
                              color: purpleText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ));
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: RichText(
                          text: TextSpan(
                            text: '${snapshot.error}',
                            style: TextStyle(color: Colors.red),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\n\nPls Check Your Network Connection',
                                style: GoogleFonts.poppins(
                                    color: purpleText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return TaskComponent(
                              taskCategory:
                                  snapshot.data[index].userId.toString(),
                              taskTitle: snapshot.data[index].todo,
                              taskTime: snapshot.data[index].createdOn);
                        }),
                        itemCount: snapshot.data.length,
                      );
                    }
                  } else {
                    return const Center(
                        child: Text('Pls check your data connections'));
                  }
                },
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemBuilder: ((context, index) {
//                   return tasks[index];
//                 }),
//                 itemCount: tasks.length,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () {
                  getAllTask();
                },
//                 onPressed: null,
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

class UserData {
  final String todo;
  final String createdOn;
  final int userId;
  final int status;
  final int id;

  UserData(
      {required this.id,
      required this.status,
      required this.todo,
      required this.createdOn,
      required this.userId});
}
