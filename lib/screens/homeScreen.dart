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
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
              height: 0.13 * scrHeight,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: 'Welcome'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                      radius: 25.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: TextField(controller: _controller,),
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 0.15 * scrHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                return Card(child: Text('meal-$index'),color: Colors.pink,);
               },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
