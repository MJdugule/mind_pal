import 'package:flutter/material.dart';
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
            Container(
              color: Colors.grey,
              height: ResConfig.screenHeight / 3,
              width: ResConfig.screenWidth / 3,
              child: const Center(
                child: Text(
                  'Home Screen',
                ),
              ),
            ),
            Container(
              color: Colors.indigo,
              height: ResConfig.screenHeight / 3,
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
            Container(
              color: Colors.blueGrey,
              height: ResConfig.screenHeight / 3,
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
