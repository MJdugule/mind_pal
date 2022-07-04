import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/home/edit_tasks_screen.dart';
import 'package:mind_pal/shared_constants/colours.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({
    Key? key,
    required this.title,
    required this.image,
    required this.subtitle,
  }) : super(key: key);
  final String title, image, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 400,
              width: 300,
            ),
          ),
          Text(title,
              style: GoogleFonts.poppins(
                  color: const Color(0xff454893),
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Text(subtitle,
              style: GoogleFonts.poppins(
                  color: const Color(0xff454893),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.5)),
        ],
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  const GetStartedButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height / 15,

      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.8,
            color: Color(0xFF393c7A),
          )),

      child: Center(
        child: Text(text,
            style: GoogleFonts.poppins(
                fontSize: 16, color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class MenuBox extends StatefulWidget {
  const MenuBox({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;

  @override
  State<MenuBox> createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  @override
  Widget build(BuildContext context) {
    return
        // InkWell(      onTap: () {
        // print('perform some api magic here');
        // },      child:
        Container(
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: blackText,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      // ),
    );
  }
}

class HomeBox extends StatelessWidget {
  const HomeBox({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);
  final Color color;
  final String text;
  final int percent = 5;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('perform some api magic here');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Progress',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${percent * 10}' '%',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            LinearPercentIndicator(
              progressColor: Colors.green,
              percent: percent / 10,
            ),
            // Text('LinearPercentIndicator was here'),
            Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WWYLTDBox extends StatelessWidget {
  const WWYLTDBox({Key? key, required this.text, required this.ontap})
      : super(key: key);
  final String text;
  final dynamic ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: blackText,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ontap));
              print('Navigate to create new task page');
            },
            child: Image.asset('assets/icons/add_icon.png'),
          ),
        ],
      ),
    );
  }
}

class HomeTaskBox extends StatelessWidget {
  const HomeTaskBox({
    Key? key,
    required this.taskCategory,
    required this.taskTitle,
    required this.taskTime,
  }) : super(key: key);
  final String taskCategory;
  final String taskTitle;
  final String taskTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            taskCategory,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: lightPurpleText,
                fontSize: 16),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 12, 30, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: redMenuBox,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: blackText,
                        fontSize: 16),
                  ),
                  Text(
                    taskTime,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blackText,
                        fontSize: 15),
                  ),
                ],
              ),
              const CircularProgressIndicator(
                value: 0.4,
                color: Colors.green,
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditTasksScreen(
                              taskCategory: 'Personal',
                              taskTitle: 'Take Casper for a walk',
                            )));
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: purpleText,
                    fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6,
      child: CupertinoSwitch(
        value: isSwitched,
        activeColor: activeSwitchColor,
        trackColor: purpleText,
        onChanged: toggleSwitch,
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, required this.hintText}) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: GoogleFonts.poppins(
            color: textFieldTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500),
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}


class AuthTextField extends StatelessWidget {
  final bool isHidden;
  final TextInputType keyboardType;
  const AuthTextField({
    Key? key,
    required this.header,
    required this.hint,
    required this.controller,
    required this.isHidden,
    required this.keyboardType,
  }) : super(key: key);

  final String header;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: ResConfig.screenHeight / 100),
          child: Text(
            header,
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: blackText,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: blackText),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isHidden,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: textFieldTextColor),
            ),
          ),
        ),
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.text, required this.onTapped})
      : super(key: key);
  final onTapped;

  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0)),
        backgroundColor: MaterialStateProperty.all(purpleText),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: buttonTextColor),
      ),
    );
  }
}

class FeatureButtonBlue extends StatelessWidget {
  const FeatureButtonBlue({Key? key, required this.route, required this.text})
      : super(key: key);

  final Widget route;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: purpleText,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: purpleText.withOpacity(0.5),
              offset: const Offset(3, 3),
              blurRadius: 3,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: buttonTextColor,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class FeatureButtonWhite extends StatelessWidget {
  const FeatureButtonWhite({Key? key, required this.route, required this.text})
      : super(key: key);

  final Widget route;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        height: 40,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: purpleText),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: textFieldTextColor,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class DigitalTaskBox extends StatefulWidget {
  const DigitalTaskBox({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<DigitalTaskBox> createState() => _DigitalTaskBoxState();
}

class _DigitalTaskBoxState extends State<DigitalTaskBox> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: blackText,
                    fontSize: 16),
              ),
              Expanded(child: SizedBox()),
              InkWell(
                  onTap: () {},
                  child: Image.asset('assets/icons/icon_pencil.png')),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Checkbox(
                  // overlayColor: MaterialStateProperty.all(activeSwitchColor),
                  // checkColor: activeSwitchColor,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BucketContent extends StatelessWidget {
  final String title;
  final String image;
  const BucketContent({Key? key, required this.title, required this.image})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Column(
      children: [

        Container(
          height: ResConfig.screenHeight / 20,
          padding: EdgeInsets.symmetric(
            horizontal: ResConfig.screenWidth / 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              Image.asset(image)
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}


class SharedContent extends StatelessWidget {
  final String title;
  final String image;
  const SharedContent({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResConfig().init(context);
    return Column(
      children: [
        Container(
          height: ResConfig.screenHeight / 20,
          padding: EdgeInsets.symmetric(
            horizontal: ResConfig.screenWidth / 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              Image.asset(image)
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

Widget buildMembersContainer(String image) => Container(
      width: 30,
      height: 70,
      child: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(image),
      ),
    );

