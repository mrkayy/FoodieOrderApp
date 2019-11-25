import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = "screen-2";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(),
            SizedBox(height: 10.0),
            Container(
              height: 40.0,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                return Text("data");
               },
              ),
            ),
          ],
        )
      ),
    );
  }
}
