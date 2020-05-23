import 'package:flutter/material.dart';
import 'package:foodie_user/models/user_authentication.dart';

import '../database/databaseHelper.dart';
import './dashboard.dart';
import '../constants.dart';
import '../controllers/snackbar_notifier.dart';

class SigninPage extends StatefulWidget {
  static String id = "signin";
  final String userName;

  SigninPage({this.userName});
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final confirmPassword = TextEditingController();
  DatabaseHelper db;
  bool hidePassword = true;
  final authUser = UserAuthentication();

  void lastUser() async {
    final lastUser = await db.getUserCredentials(widget.userName);
    if (lastUser.first.loginState) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Dashboard(currentuser: lastUser.first)));
    }
  }

  void validateUser(UserAuthentication verifypassword) async {
    final userauth = await db.getUserCredentials(widget.userName);

    if (userauth.length != null) {
      if (userauth.first.password == verifypassword.password) {
        await db
            .signinUser(
          UserAuthentication(
            loginState: true,
            user: userauth.first.user,
          ),
        )
            .whenComplete(() {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Dashboard(currentuser: userauth.first)));
        });
      } else {
        notifiey(
          icons: Icons.warning,
          msg: 'Incorrect password!',
          key: scaffoldKey,
        );
        print('wrong password');
      }
    }
  }

  @override
  void initState() {
    db = DatabaseHelper();
    lastUser();
    super.initState();
  }

  @override
  void dispose() {
    confirmPassword.dispose();
    // db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    // double textFormPadding = 0.036 * scrData.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        key: scaffoldKey,
        // backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                // alignment: Alignment.bottomCenter,
                colorFilter:
                    // colorFilter:
                    //     ColorFilter.mode(Colors.white, BlendMode.softLight),
                    ColorFilter.mode(Colors.blue, BlendMode.softLight),
                image: AssetImage('assets/images/stock-image-2.png'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // margin: const EdgeInsets.only(bottom:20.0),
                  padding: const EdgeInsets.only(top: 120),
                  child: Material(
                    color: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/applogo.png",
                        height: 100.0 / 1.4,
                        width: 100.0 / 1.4,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(25.0),
                  margin: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    bottom: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .copyWith(
                                      fontSize: 32.0, color: Colors.black),
                            ),
                            TextSpan(
                              text: "\nWelcome back ${widget.userName}!",
                              style: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.036 * scrData.height),
                      //Login text field
                      TextField(
                        obscureText: hidePassword,
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.w200,
                            fontSize: 21.0,
                            letterSpacing: 2.5),
                        controller: confirmPassword,
                        decoration: kLoginDecoration.copyWith(
                          suffixIcon: hidePassword
                              ? IconButton(
                                  color: Colors.black,
                                  icon: Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                )
                              : IconButton(
                                  color: Colors.black,
                                  icon: Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),
                        ),
                      ),
                      SizedBox(height: 0.050 * scrData.height),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // minWidth: 0.3 * scrData.width,
                          padding: const EdgeInsets.all(18.0),
                          color: Colors.white,
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                fontSize: 16.0,
                                color: Colors.blue[800],
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () {
                            if (confirmPassword.text.isNotEmpty) {
                              authUser.password = confirmPassword.text;
                              validateUser(authUser);
                            } else {
                              notifiey(
                                key: scaffoldKey,
                                msg: 'Please enter your password!',
                                icons: Icons.warning,
                              );
                            }
                            // authUser.user = '';
                            // if (confirmPassword.text.isNotEmpty) {
                            //   if (confirmPassword.text == widget.password) {
                            //     FocusScope.of(context).requestFocus(FocusNode());
                            //     Navigator.of(context)
                            //         .pushReplacementNamed(Dashboard.id);
                            //   } else {
                            //     notifiey(
                            //       icons: Icons.warning,
                            //       msg: 'Incorrect password!',
                            //       key: scaffoldKey,
                            //     );
                            //   }
                            // }
                          },
                        ),
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
