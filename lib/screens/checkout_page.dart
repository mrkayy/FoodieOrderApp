import 'package:flutter/material.dart';

import '../models/order_items.dart';

class CheckputPage extends StatefulWidget {
  final List<OrderItems> order;
  CheckputPage({this.order});
  @override
  _CheckputPageState createState() => _CheckputPageState();
}

class _CheckputPageState extends State<CheckputPage> {
  
  var total = 0.0;
  // List<double> subtotal = [];

  void subTotal() {
    total = 0.0;
    // subtotal = [];
    // for (var i in widget.order) {
    //   subtotal.add(i.orderItemAmount);
    // }
    widget.order.forEach((e) => total += e.orderItemAmount);
    print(total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child:
            //  Column(
            //   children: <Widget>[
            ListView.builder(
          itemCount: widget.order.length,
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () {
                subTotal();
              },
              subtitle: Text('${widget.order[index].orderID}'),
              title: Text('${widget.order[index].orderItemName}'),
              leading: Text('${widget.order[index].foodCategotyID}'),
              trailing: Text('NGN ${widget.order[index].orderItemAmount}'),
            );
          },
        ),
        //   ],
        // ),
      ),
    );
  }
}
