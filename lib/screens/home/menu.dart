import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/bucket_list/bucket_congrats.dart';
import 'package:mind_pal/screens/home/bucket_list/bucket_digital.dart';
import 'package:mind_pal/screens/home/bucket_list/bucket_welcome.dart';
import 'package:mind_pal/screens/home/home.dart';
import 'package:mind_pal/screens/home/shared_tasks/shared_welcome.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

import 'alltasks.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How are you planning today?',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: greyText,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: ResConfig.screenHeight / 15,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: (170 / 130),
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllTasksScreen()));
                      },
                      child: MenuBox(color: redMenuBox, text: 'All Tasks')),
                  MenuBox(color: lilacMenuBox, text: 'Today\'s Tasks'),
                  InkWell(
                    onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SharedTask()));
                      },
                      child: MenuBox(color: purpleMenuBox, text: 'Shared Tasks')),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BucketList()));
                      },
                      child: MenuBox(color: creamMenuBox, text: 'My Lists')),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print('more api magic here');
                  },
                  child: Image.asset('assets/icons/add_icon.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
