import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/screens/home/success.dart';
import 'package:mind_pal/screens/home/saved.dart';
import 'package:mind_pal/screens/home/menu.dart';
import 'package:mind_pal/shared_constants/res_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Log Out')),
            Container(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Menu()));
                  },
                  child: Text('Check new page')),
            ),
            Container(
              color: Colors.grey,
              height: ResConfig.screenHeight / 3.2,
              width: ResConfig.screenWidth / 3,
              child: const Center(
                child: Text(
                  'Home Screen',
                ),
              ),
            ),
            Container(
              color: Colors.indigo,
              height: ResConfig.screenHeight / 3.2,
              margin: EdgeInsets.symmetric(
                vertical: ResConfig.safeBlockVertical,
                horizontal: ResConfig.safeBlockHorizontal,
              ),
              child: Center(
                child: Text(
                  'Home Screen',
                  style: TextStyle(
                    fontSize: ResConfig.safeBlockVertical * 5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ResConfig.screenHeight / 30,
            ),
            Container(
              color: Colors.blueGrey,
              height: ResConfig.screenHeight / 3.2,
              //  width: ResConfig.screenWidth / 0.5,
              child: Center(
                child: Text(
                  'Home Screen',
                  style: TextStyle(
                    fontSize: ResConfig.safeBlockVertical,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
