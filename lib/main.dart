import 'package:flutter/material.dart';

import 'screens/homeScreen.dart';
import 'screens/orderScreen.dart';

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
      initialRoute: HomeScreen.id,
      routes: <String,WidgetBuilder>{
        HomeScreen.id: (BuildContext context) => HomeScreen(),
        CreateOrder.id: (BuildContext context) => CreateOrder(),
      },
    );
  }
}