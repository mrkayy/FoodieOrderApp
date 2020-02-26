import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './register_page.dart';
import './signin_page.dart';

class SplashScreen extends StatefulWidget {
  static String id = "initRoute";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _userAlreadyRegistered = false;
  String userName, userPassword;

  Future<void> _appHasUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool prefValue = prefs.getBool("app_has_user");
    if (prefValue == true) {
      //get username from storage
      userName = prefs.getString("user_name");
      userPassword = prefs.getString("password");
      //application already has a user
      setState(() {
        _userAlreadyRegistered = !_userAlreadyRegistered;
      });
    }
  }

  void _delayScreen() {
    Future.delayed(Duration(seconds: 3), () {
      if (_userAlreadyRegistered) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    SigninPage(userName: userName, password: userPassword)));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => RegisterPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _appHasUser().then((_) => _delayScreen());
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
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/applogo.png",
                          height: 115.0 / 1.4,
                          width: 115.0 / 1.4,
                        ),
                      ),
                    ),
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
