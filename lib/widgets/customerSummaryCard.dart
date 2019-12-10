import 'package:flutter/material.dart';
// import 'package:foodie_order_app/models/customers.dart';

class CustomerSummaryCard extends StatelessWidget {
  final String name;
  final String phone;
  final String orderCount;
  final String id;

  const CustomerSummaryCard({
    Key key,
    this.name,
    this.phone,
    this.orderCount,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("name"),
    );
  }
}
