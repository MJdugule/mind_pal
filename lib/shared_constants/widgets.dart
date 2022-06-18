import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/shared_constants/colours.dart';
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
      height: MediaQuery.of(context).size.height / 12,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(text,
            style: GoogleFonts.poppins(
                fontSize: 16, color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class MenuBox extends StatelessWidget {
  const MenuBox({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('perform some api magic here');
      },
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: blackText,
              fontSize: 18,
            ),
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 12.0 , horizontal: 18.0),
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
