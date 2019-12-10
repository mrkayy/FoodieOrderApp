import 'package:flutter/material.dart';

import '../constants.dart';

class CustomerInfoCard extends StatelessWidget {
  // final String id;
  final String name;
  final String phone;
  final String orderCount;

  const CustomerInfoCard({
    // this.id,
    this.name,
    this.phone,
    this.orderCount,
  });
  // final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20.0,
          child: Text(name[0]),
        ),
        title: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(text: name, style: kContantTitle),
            TextSpan(text: "\n"),
            TextSpan(text: phone, style: kContantTitle),
          ]),
        ),
        trailing: Text("Order Count: $orderCount"),
      ),
    );
  }
}
