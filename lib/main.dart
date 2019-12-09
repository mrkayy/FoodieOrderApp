import 'package:flutter/material.dart';

import 'screens/homeScreen.dart';
import 'screens/mainScreen.dart';
import 'screens/bookingScreen.dart';
import 'screens/orderStatus/orderForm.dart';
import 'screens/profileScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Order',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: MainScreen.id,
      routes: <String, WidgetBuilder>{
        HomeScreen.id: (BuildContext context) => HomeScreen(),
        OrderScreen.id: (BuildContext context) => OrderScreen(),
        MainScreen.id: (BuildContext context) => MainScreen(),
        ProfileScreen.id: (BuildContext context) => ProfileScreen(),
        CreateOrder.id: (BuildContext context) => CreateOrder(),
      },
    );
  }
}
