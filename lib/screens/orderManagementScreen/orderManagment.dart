import 'package:flutter/material.dart';

class AllOrders extends StatefulWidget {
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("All Order")));
  }
}

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


class CompletedOrder extends StatefulWidget {
  @override
  _CompletedOrderState createState() => _CompletedOrderState();
}

class _CompletedOrderState extends State<CompletedOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("completed")));
  }
}


class PendingOrder extends StatefulWidget {
  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Pending")));
  }
}
