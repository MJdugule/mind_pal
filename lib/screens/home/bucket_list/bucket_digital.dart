import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mind_pal/models/task_model.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/screens/createTask/createScreen.dart';
import 'package:mind_pal/screens/home/success.dart';
import 'package:mind_pal/screens/home/saved.dart';
import 'package:mind_pal/screens/home/menu.dart';
import 'package:mind_pal/screens/home/what_would_you_like_to_do.dart';
import 'package:mind_pal/services/database_service.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BucketDigital extends StatefulWidget {
  const BucketDigital({Key? key}) : super(key: key);

  @override
  State<BucketDigital> createState() => _BucketDigitalState();
}

class _BucketDigitalState extends State<BucketDigital> {
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
              const Text(
                'Digital',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: blackText,
                ),
              ),
              const Text(
                'Here\'s a glimpse of what your list currently looks like. You can add, update, or delete goals anytime.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: greyText,
                ),
              ),
              Container(
                color: digitalBox,
                child: Column(
                  children: [
                    const Text(
                      'Fego\'s goals',
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
                          return DigitalTaskBox();
                        }),
                        itemCount: 4,
                      ),
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
