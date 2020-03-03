import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/registration_complete.dart';
import '../constants.dart';

class RegisterPage extends StatefulWidget {
  static String id = "register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String newUser;
  String newPassword;

  Future<void> registerNewUser(
      {String user, String pass, bool hasRegistered}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_name", user);
    prefs.setString("password", pass);
    prefs.setBool("app_has_user", hasRegistered);
  }

  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    userName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        elevation: 4.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.asset(
                            "assets/images/applogo.png",
                            height: 80.0,
                            width: 80.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Create Account',
                        style: GoogleFonts.workSans(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        'Join the fastest growing community of Foodie\'s',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        decoration: kRegisterDecoration.copyWith(
                            labelText: 'User Name'),
                        // InputDecoration(hintText: 'Enter User Name'),
                        controller: userName,
                      ),
                      SizedBox(height: 15.0),
                      TextField(
                        decoration: kRegisterDecoration.copyWith(
                            labelText: 'Password'),
                        controller: password,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15.0),
                        color: Colors.blue,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          if (userName.text.isNotEmpty &&
                              password.text.isNotEmpty) {
                            registerNewUser(
                                    user: userName.text,
                                    pass: password.text,
                                    hasRegistered: true)
                                .then((_) {
                              // newUser = userName.text;
                              // newPassword = password.text;
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RegistrationCompleted()));
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
