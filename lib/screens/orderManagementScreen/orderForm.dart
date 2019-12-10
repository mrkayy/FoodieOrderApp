import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/order.dart';
import '../../utils/demo-data.dart';

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
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Food Order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Enter Customer OrderDetails"),
              SizedBox(height: 10.0),
              Container(
                // color: Colors.greenAccent,
                width: 0.6 * scrData.width,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (input) {},
                      onSaved: (input) {},
                      decoration: kOrderFormText.copyWith(
                          labelText: "enter customer name"),
                    ),
                    TextFormField(
                      validator: (input) {},
                      onSaved: (input) {},
                      decoration:
                          kOrderFormText.copyWith(labelText: "phone number"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Text("Add food item"),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Text("Press add new food item to your order"),
                  FlatButton(
                    // padding: const EdgeInsets.all(0.0),

                    child: Icon(Icons.add),
                    onPressed: () {
                      // setState(() {
                      //   orderItem.add(NewTextBox());
                      // });
                      placeOrderDialog(context);
                    },
                  ),

                  FlatButton(
                    // padding: const EdgeInsets.all(0.0),
                    child: Text("clear"),
                    onPressed: () {
                      setState(() {
                        orderItem.clear();
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: 0.4 * scrData.width,
                      child: Column(children: orderItem)),
                  Container(
                      width: 0.25 * scrData.width,
                      child: Column(children: orderItem)),
                ],
              ),
              Divider(height: 32.0),
              Text("OrderSummary"),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  void placeOrderDialog(context) {
    var customerList = AlertDialog(
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Select Customer",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.orangeAccent),
            ),
          ),
          // Container(

          // child:
          //   ),
          // ),
          Container(
            width: 400.0,
            height: 500.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: ListView.builder(
              itemCount: Demodata.customerInfo.length,
              itemBuilder: (BuildContext context, int index) {
                return Demodata.customerInfo[index];
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("done"),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("cancel"),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) {
        return customerList;
      },
    );
  }

  Widget NewTextBox() {
    return TextFormField();
  }
}
