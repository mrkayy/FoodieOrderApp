import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/dashboard.dart';

// import 'constants.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Foodie',
      theme: ThemeData(
        // fontFamily: GoogleFonts.comfortaa(),
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        Dashboard.id: (BuildContext context) => Dashboard(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  static String id = "initRoute";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void delayScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Dashboard()));
    });
  }

  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: <Widget>[
          // Container(
          //   color: Colors.deepOrange,
          //   width: double.infinity,
          //   height: scrData.height,
          // ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              // color: Colors.black,
              width: double.infinity,
              height: scrData.height, //0.75 * scrData.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.red[900].withOpacity(1),
                    Colors.red[900].withOpacity(0.9),
                    Colors.red[900].withOpacity(0.8),
                    Colors.red[900].withOpacity(0.7),
                    Colors.red[900].withOpacity(0.6),
                    Colors.red[800].withOpacity(0.5),
                    Colors.red[800].withOpacity(0.4),
                    // Colors.red[800].withOpacity(0.3),
                    // Colors.red[800].withOpacity(0.2),
                    Colors.red[800].withOpacity(0.1),
                    Colors.red[800].withOpacity(0.05),
                    Colors.red[800].withOpacity(0.025),
                  ],
                ),
              ),
              // child: Text("data"),
            ),
          ),
          Positioned(
            bottom: 0.25 * scrData.height,
            left: 0.0,
            right: 0.0,
            child: Center(
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
          //TODO: add animation for login for
        ],
      ),
    );
  }
}
