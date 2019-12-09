import 'package:flutter/material.dart';

class CancelledOrder extends StatefulWidget {
  @override
  _CancelledOrderState createState() => _CancelledOrderState();
}

class _CancelledOrderState extends State<CancelledOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Cancalled")));
  }
}
