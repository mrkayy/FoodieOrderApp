import 'package:flutter/material.dart';

class CreateOrder extends StatefulWidget {
  static String id = "orderScreen";
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Create Order here'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
