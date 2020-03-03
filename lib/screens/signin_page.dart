import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../controllers/snackbar_notifier.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final confirmPassword = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    double textFormPadding = 0.036 * scrData.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.only(bottom:20.0),
                  padding: const EdgeInsets.only(top: 180),
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
                  padding: const EdgeInsets.only(top: 100),
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Login",
                              style: GoogleFonts.workSans(
                                fontSize: 32.0,
                              ),
                            ),
                            TextSpan(
                              text: "\nWelcome back ${widget.userName}!",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.036 * scrData.height),
                      //Login text field
                      TextField(
                        obscureText: hidePassword,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 18.0,
                            letterSpacing: 2.5),
                        controller: confirmPassword,
                        decoration: kLoginDecoration.copyWith(
                          suffixIcon: hidePassword
                              ? IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                )
                              : IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                        ),
                      ),
                      SizedBox(height: 0.036 * scrData.height),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        // minWidth: 0.3 * scrData.width,
                        padding: const EdgeInsets.all(15.0),
                        color: Colors.white,
                        child: Text("Login",
                            style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                color: Colors.blue[800],
                                fontWeight: FontWeight.w400)),
                        onPressed: () {
                          if (confirmPassword.text.isNotEmpty) {
                            if (confirmPassword.text == widget.password) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.of(context)
                                  .pushReplacementNamed(Dashboard.id);
                            } else {
                              notifiey(
                                icons: Icons.warning,
                                msg: 'Incorrect password!',
                                key: scaffoldKey,
                              );
                            }
                          } else {
                            notifiey(
                              key: scaffoldKey,
                              msg: 'Please enter your password!',
                              icons: Icons.warning,
                            );
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
      ),
    );
  }
}
