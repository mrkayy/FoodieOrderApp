import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/user_profile.dart';
import '../database/databaseHelper.dart';
import '../models/user_authentication.dart';
import '../screens/registration_complete.dart';

class RegisterPage extends StatefulWidget {
  static String id = "register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userName;
  String userPhone;
  String userpassword;
  String userFirstname;
  final DatabaseHelper db = DatabaseHelper();

  final formkey = GlobalKey<FormState>();

  Future<void> registerNewUser(
      {String user,
      String pass,
      String phone,
      String firstName,
      bool hasRegistered}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await db.createUserProfile(UserProfile(
      fn: firstName,
      userName: user,
      phoneNumber: phone,
    ));
    await db
        .createUserAuthentication(
            UserAuthentication(user: user, password: pass, loginState: true))
        .then((created) {
      if (created != null) {
        prefs.setString("user_name", user);
        prefs.setBool("app_has_user", hasRegistered);
      } else {
        print('error occured!!!');
      }
    });
  }

  Future<void> submitForm() async {
    final formstate = formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      await registerNewUser(
        user: userName,
        phone: userPhone,
        pass: userpassword,
        hasRegistered: true,
        firstName: userFirstname,
      ).whenComplete(() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RegistrationCompleted()));
      });
      formstate.reset();
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.softLight),
                image: AssetImage('assets/images/stock-image-1.jpg'),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/images/applogo.png",
                  height: 80.0,
                  width: 80.0,
                ),
                // Material(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(40.0)),
                //   elevation: 4.0,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(40.0),
                //     child: Image.asset(
                //       "assets/images/applogo.png",
                //       height: 80.0,
                //       width: 80.0,
                //     ),
                //   ),
                // ),
                SizedBox(height: 25.0),
                Text(
                  'Create Account',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.blue),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Join the fastest growing community of Foodie\'s',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(height: 30.0),
                Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: kRegisterDecoration.copyWith(
                          labelText: 'First Name',
                          labelStyle: Theme.of(context).textTheme.subhead,
                        ),
                        onSaved: (e) => userFirstname = e,
                        validator: (e) =>
                            e.isEmpty ? 'please enter first name' : null,
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: kRegisterDecoration.copyWith(
                          labelText: 'User Name',
                          labelStyle: Theme.of(context).textTheme.subhead,
                        ),
                        onSaved: (e) => userName = e,
                        validator: (e) =>
                            e.isEmpty ? 'please enter user name' : null,
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: kRegisterDecoration.copyWith(
                          labelText: 'Phone Number',
                          labelStyle: Theme.of(context).textTheme.subhead,
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (e) => userPhone = e,
                        validator: (e) =>
                            e.isEmpty ? 'please enter phone number' : null,
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: kRegisterDecoration.copyWith(
                          labelText: 'password',
                          labelStyle: Theme.of(context).textTheme.subhead,
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (e) => userpassword = e,
                        validator: (e) => e.isEmpty || e.length <= 4
                            ? 'password unacceptable'
                            : null,
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  color: Colors.blue,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => submitForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
