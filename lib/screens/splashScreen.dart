import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class StartScreen extends StatefulWidget {
  static String id = "startScreen";

  // StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {


  void delayScreen(){
    Future.delayed(Duration(seconds:5),(){
      Navigator.pushReplacementNamed(context, MainScreen.id);
    });
  }

  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              // gradient: LinearGradient(
                
              // )
            ),
            child: Center(
         child: Text("Splash Screen", style:TextStyle(fontSize: 28).copyWith(color: Colors.deepOrange)),
      ),
          ),
    );
  }
}