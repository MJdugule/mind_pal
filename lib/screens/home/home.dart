import 'package:flutter/material.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/screens/createTask/createScreen.dart';
import 'package:mind_pal/screens/home/success.dart';
import 'package:mind_pal/screens/home/saved.dart';
import 'package:mind_pal/screens/home/menu.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:mind_pal/shared_constants/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  showdraw(){
    const Drawer();
  }
  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: const Menu(),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 25, color: purpleText,),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello, Fego!'),
              Text('Today\'s a great day to meet your goals!'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Hello, Fego!'),
                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => CreateTaskScreen())));},
                  child: CircleAvatar(
                    backgroundColor: redMenuBox,
                    child: Icon(Icons.add, color: Colors.white, size: 30,),
                  ),
                )
                ],
              ),
              HomeBox(color: purpleText, text: 'You\'re doing great so far. keep going!'),
              Container(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  child: const Text('Log Out')),
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Menu()));
                    },
                    child: const Text('Check new page')),
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
      ),
    );
  }
}
