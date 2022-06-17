import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Image.asset(
            image,
            height: 400,
            width: 300,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xff454893),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: const TextStyle(
                height: 1.5,
                color: Color(0xff454893),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}


class GetStartedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  const GetStartedButton({Key? key,
    required this.color,
    required this.text,
    required this.textColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height/12,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(text, style: GoogleFonts.poppins(
            fontSize: 16, color: textColor, fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}
