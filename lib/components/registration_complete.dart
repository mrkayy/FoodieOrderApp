import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/dashboard.dart';

class RegistrationCompleted extends StatefulWidget {
  static String id = 'userCreated';
  @override
  _RegistrationCompletedState createState() => _RegistrationCompletedState();
}

class _RegistrationCompletedState extends State<RegistrationCompleted> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Glad to have you onboard!",
                    style: GoogleFonts.workSans(fontSize: 20.0)),
                SizedBox(height: 20.0),
                Image.asset("assets/images/success.png"),
                SizedBox(height: 20.0),
                FlatButton(
                  child: Text('Continue'),
                  onPressed: () =>
                      Navigator.of(context).popAndPushNamed(Dashboard.id),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
