import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/screens/home/menu.dart';
import 'package:mind_pal/screens/home/what_would_you_like_to_do.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  showdraw() {
    const Drawer();
  }

  List tasks = [
    const HomeTaskBox(
        taskCategory: 'Personal',
        taskTitle: 'Take Casper for a walk',
        taskTime: '15:00 - 16:00'),
    const HomeTaskBox(
        taskCategory: 'Work',
        taskTitle: 'Stakeholders meeting',
        taskTime: '17:00 - 18:00'),
    const HomeTaskBox(
        taskCategory: 'Personal',
        taskTitle: 'Take Casper for a walk',
        taskTime: '15:00 - 16:00'),
    const HomeTaskBox(
        taskCategory: 'Work',
        taskTitle: 'Stakeholders meeting',
        taskTime: '17:00 - 18:00'),
  ];

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: const Menu(),
        width: ResConfig.screenWidth,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 25,
          color: purpleText,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          ElevatedButton(
              onPressed: () async {
                final initScreen = await SharedPreferences.getInstance();
                initScreen.setInt('initScreen', 1);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text('Log Out')),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Fego!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: blackText,
                ),
              ),
              const Text(
                'Today\'s a great day to meet your goals!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: greyText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'June 30, 2022',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: blackText,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: redMenuBox,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WhatWouldYouLikeToDo()));
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          )),
                    )
                  ],
                ),
              ),
              const HomeBox(
                  color: purpleText,
                  text: 'You\'re doing great so far. Keep going!'),
              SizedBox(
                height: ResConfig.screenHeight / 20,
              ),
              const Text(
                'Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: purpleText,
                  fontSize: 20,
                ),
              ),
              Container(
                height: ResConfig.screenHeight / 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return tasks[index];
                  }),
                  itemCount: tasks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
