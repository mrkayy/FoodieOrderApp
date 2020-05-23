import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';

class RegistrationCompleted extends StatelessWidget {
  static String id = 'userCreated';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Glad to have you onboard!",
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 20.0),
            Image.asset("assets/images/success.png"),
            SizedBox(height: 20.0),
            FlatButton(
                child: Text(
                  'Continue',
                  style: Theme.of(context).textTheme.headline,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(SplashScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
