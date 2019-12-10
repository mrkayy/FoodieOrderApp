import 'package:flutter/material.dart';

import '../constants.dart';

class OrderManagmentCard extends StatelessWidget {
  final String count;
  final String title;

  OrderManagmentCard({this.count, this.title});

  // const OManagmentCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Container(
      width: 0.23 * scrData.width,
      height: 0.10 * scrData.height,
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        // margin: EdgeInsets.only(right: 10.0),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              count,
              style: TextStyle(fontSize: 21.0,
              fontWeight: FontWeight.w500),
            ),
            Text(
              title,
              style: kNotificationText,
            ),
          ],
        ),
      ),
    );
  }
}
