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
            style: GoogleFonts.poppins(color: const Color(0xff454893),
                fontSize: 30,fontWeight: FontWeight.bold )

          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style:
            GoogleFonts.poppins(color: const Color(0xff454893),
                fontSize: 15,fontWeight: FontWeight.w500,height: 1.5 )
          ),
        ],
      ),
    );
  }
}
