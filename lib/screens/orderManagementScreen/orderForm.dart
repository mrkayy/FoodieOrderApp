import 'package:flutter/material.dart';
// import '../../constants.dart';
// import '../../utils/demo-data.dart';

class CreateOrder extends StatefulWidget {
  static String id = "newOrderPG";
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  String sCustomerName;
  String sCustomerPhone;

  void setCustomer(String name, String phone) {
    setState(() {
      sCustomerName = name;
      sCustomerPhone = phone;
    });
  }

  List<Widget> orderItem = [];

  @override
  Widget build(BuildContext context) {
    // final scrData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Food Order'),
      ),
      body: Center(
        child: Text("Create new form"),
      ),
    );
  }
}
