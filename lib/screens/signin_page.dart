import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './dashboard.dart';

class SigninPage extends StatefulWidget {
  final String userName;
  final String password;

  SigninPage({this.userName, this.password});

  static String id = "signin";
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.blue,
        body: Container(
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
              children: [
                Container(
        padding: const EdgeInsets.only(top: 220),
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
                  height: 100.0 / 1.4,
                  width: 100.0 / 1.4,
                ),
              ),
            ),
            Text(
              'Foodie',
              // style: kHeadingText.copyWith(color: Colors.white, fontSize: 36.0),
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 42.0 / 1.4,
              ),
            ),
          ],
        ),
                ),
                Container(
        // padding: const EdgeInsets.only(bottom: 120),
        margin: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Login",
                    style: GoogleFonts.workSans(
                      fontSize: 28.0,
                    ),
                  ),
                  TextSpan(
                    text: "\nWelcome back ${widget.userName}",
                    style: GoogleFonts.workSans(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: confirmPassword,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "Enter Password"),
            ),
            SizedBox(height: 0.04 * scrData.height),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              minWidth: 0.5 * scrData.width,
              color: Colors.white,
              child: Text("Login",
                  style: GoogleFonts.workSans(fontSize: 22.0)),
              onPressed: () {
                if (confirmPassword.text.isNotEmpty) {
                  if (confirmPassword.text == widget.password) {
                    FocusScope.of(context)
                        .requestFocus(FocusNode());
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed(Dashboard.id);
                  }
                }
              },
            ),
          ],
        ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
