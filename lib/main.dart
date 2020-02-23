import 'package:flutter/material.dart';

import './screens/dashboard.dart';
import './screens/splash_screen.dart';
import './screens/records_page.dart';
import './screens/customers.dart';
import './screens/food_category_page.dart';
import './screens/order_page.dart';
import './screens/profile_page.dart';
import 'screens/register_page.dart';
import 'screens/signin_page.dart';
// import './screens/';

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
        RecordsPage.pageid: (BuildContext context) => RecordsPage(),
        CustomerPage.id:(BuildContext context)=> CustomerPage(),
        OrderPage.id:(BuildContext context)=> OrderPage(),
        FoodCategoryPage.id:(BuildContext context)=> FoodCategoryPage(),
        ProfilePage.id:(BuildContext context)=> ProfilePage(),
        SigninPage.id:(BuildContext context)=> SigninPage(),
        RegisterPage.id:(BuildContext context)=> RegisterPage(),
      },
    );
  }
}
