import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget richTextInfoCard({String info, String title}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
          text: '$title \n',
          style: GoogleFonts.workSans(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 12.0),
        ),
        TextSpan(
          text: info,
          style: GoogleFonts.workSans(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 18.0),
        ),
      ],
    ),
  );
}
