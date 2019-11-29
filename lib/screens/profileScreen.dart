import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  
  static String id = "screen-4";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('welcome'),),
    );
  }
}