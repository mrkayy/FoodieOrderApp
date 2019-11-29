import 'package:flutter/material.dart';

class OrderOverView extends StatelessWidget {
  final String status;
  final String timeStamp;
  final String customerName;
  final String customerPhone;
  final String orderAmount;
  final String itemCount;
  final String vendorName;

  OrderOverView({
    this.status,
    this.timeStamp,
    this.customerName,
    this.customerPhone,
    this.orderAmount,
    this.vendorName,
    this.itemCount,
  });

  final int _countOn = 0;

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
            width: 0.58 * scrWidth,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Card(child: Text("STORE COUNT $_countOn"),),
            ),),
        Positioned(
          top: 0.0,
          left: 15.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17.0),
                  topRight: Radius.circular(17.0)),
            ),
            height: 50.0,
            width: 0.58 * scrWidth,
            child: Center(
                child: Text(
              "Completed!",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 15.0,
          child: MaterialButton(
            minWidth: 0.58 * scrWidth,
            height: 52.0,
            onPressed: () {
            },
            child: Text(
              "view",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
            ),
          ),
        )
      ],
    );
  }
}
