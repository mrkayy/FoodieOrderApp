import 'package:flutter/material.dart';

class OrderOverView extends StatelessWidget {
  final String status;
  final String timeStamp;
  final String customerName;
  final String customerPhone;
  final String orderAmount;
  final String itemCount;
  final String vendorName;
  final String orderType;
  Color sColor;

  OrderOverView({
    this.status,
    this.timeStamp,
    this.customerName,
    this.customerPhone,
    this.orderAmount,
    this.vendorName,
    this.orderType,
    this.itemCount,
    this.sColor,
  });

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 6.0,
          child: Container(
            // color: Colors.blueGrey[100],
            // padding: EdgeInsets.all(8.0),
            // margin: EdgeInsets.symmetric(horizontal: 15.0),
            width: 0.58 * scrData.width,
            height: 380, //0.50 * scrData.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    color: Colors.grey[200],
                  ),
                  height: 0.48 * scrData.width,
                  child: Center(
                    child: Text(vendorName[0]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        customerName,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        timeStamp,
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  heightFactor: 2.0,
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0))),
                    minWidth: 0.58 * scrData.width,
                    height: 0.06 * scrData.height,
                    // color: Colors.grey[200],
                    onPressed: () {},
                    child: Center(
                      child: Text("view"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: MaterialButton(
        //     minWidth: 0.58 * scrData.width,
        //     color: Colors.grey[200],
        //     onPressed: () {},
        //     child: Center(
        //       child: Text("view"),
        //     ),
        //   ),
        // ),
        Positioned(
          top: 15.0,
          left: 30.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[600],
            ),
            child: Text(
              orderType,
              style: TextStyle(
                  letterSpacing: 1.0, fontSize: 11.0, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          right: 30.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: sColor,
            ),
            child: Text(
              status,
              style: TextStyle(
                  letterSpacing: 1.0, fontSize: 11.0, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
