import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CreateOrder extends StatefulWidget {
  static String id = "newOrderPG";
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
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
                      setState(() {
                        orderItem.add(NewTextBox());
                      });
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: <Widget>[
                    Text("OrderSummary"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NewTextBox() {
    return TextFormField();
  }
}
