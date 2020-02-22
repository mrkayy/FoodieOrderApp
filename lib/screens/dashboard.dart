import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static String id = 'screen_1';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Dashboard'),),
    );
  }
}