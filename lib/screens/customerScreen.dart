import 'package:flutter/material.dart';
import '../utils/demo-data.dart';

class CustomerContact extends StatefulWidget {
  static String id = "screen-5";

  @override
  _CustomerContactState createState() => _CustomerContactState();
}

class _CustomerContactState extends State<CustomerContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Center(
            child: ListView.builder(
              itemCount: Demodata.customerInfo.length,
              itemBuilder: (BuildContext context, int index) {
                return Demodata.customerInfo[index];
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, //TODO: Add dialog to create new customer
        child: Icon(Icons.add),
      ),
    );
  }
}
