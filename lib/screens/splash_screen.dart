import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './signin_page.dart';
import './onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  static String id = "initRoute";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _userAlreadyRegistered;
  String userName;

  Future<bool> _appHasUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool prefValue = prefs.getBool("app_has_user");

    switch (prefValue.toString()) {
      case 'null':
        print('first time user!');
        _userAlreadyRegistered = false;
        break;
      case 'true':
        _userAlreadyRegistered = true;
        //get username from storage
        userName = prefs.getString("user_name");
        break;
      default:
    }
    return _userAlreadyRegistered;
  }

  void _delayScreen(bool appHasUser) {
    Future.delayed(Duration(seconds: 3), () {
      if (appHasUser) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    SigninPage(userName: userName)));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _appHasUser().then((val) => _delayScreen(val));
  }

  @override
  Widget build(BuildContext context) {
    // final scrData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
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
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      elevation: 4.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          "assets/images/applogo.png",
                          height: 115.0,
                          width: 115.0,
                        ),
                      ),
                    ),
                    // Material(
                    //   color: Colors.white,
                    //   shape: CircleBorder(),
                    //   elevation: 5.0,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Image.asset(
                    //       "assets/images/applogo.png",
                    //       height: 115.0 / 1.4,
                    //       width: 115.0 / 1.4,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      'Foodie',
                      // style: kHeadingText.copyWith(color: Colors.white, fontSize: 36.0),
                      style: GoogleFonts.pacifico(
                        color: Colors.white,
                        fontSize: 42.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 37.0),
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
      ),
    );
  }
}
