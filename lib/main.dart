import 'package:flutter/material.dart';

import './screens/dashboard.dart';
import './screens/splash_screen.dart';
import './screens/admin_settings.dart';

// import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        Dashboard.id: (BuildContext context) => Dashboard(),
        AdminSettingsPage.pageid: (BuildContext context) => AdminSettingsPage(),
      },
    );
  }
}
