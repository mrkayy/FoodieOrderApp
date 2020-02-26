import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RecordsPage extends StatefulWidget {
  static String pageid = "settings";

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Records",
          style: GoogleFonts.pacifico(),
        ),
        centerTitle: true,
      ),
    );
  }
}