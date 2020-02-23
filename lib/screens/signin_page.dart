import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatefulWidget {
  final String userName;

  SigninPage({this.userName});

  static String id = "signin";
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
  final scrData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity, //0.75 * scrData.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.blue[900].withOpacity(1),
                    Colors.blue[900].withOpacity(0.9),
                    Colors.blue[900].withOpacity(0.8),
                    Colors.blue[900].withOpacity(0.7),
                    Colors.blue[900].withOpacity(0.6),
                    Colors.blue[800].withOpacity(0.5),
                    Colors.blue[800].withOpacity(0.4),
                    Colors.blue[800].withOpacity(0.1),
                    Colors.blue[800].withOpacity(0.05),
                    Colors.blue[800].withOpacity(0.025),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.5 * scrData.height,
            child: Material(
              color: Colors.white,
              shape: CircleBorder(),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  "assets/images/applogo.png",
                  height: 110.0,
                  width: 110.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.25 * scrData.height,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Foodie',
                // style: kHeadingText.copyWith(color: Colors.white, fontSize: 36.0),
                style: GoogleFonts.pacifico(
                  color: Colors.white,
                  fontSize: 42.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.02 * scrData.height,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'powered by: Cedarcliff Services',
                // style: kHeadingText.copyWith(color: Colors.white, fontSize: 36.0),
                style: GoogleFonts.workSans(
                  letterSpacing: 0.8,
                  fontSize: 10.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
