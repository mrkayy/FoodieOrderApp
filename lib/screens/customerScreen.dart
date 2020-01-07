import 'package:flutter/material.dart';
import '../utils/demo-data.dart';
import '../widgets/customerDialogs.dart';
import '../widgets/customerDialogs.dart';

class CustomerContact extends StatefulWidget {
  static String id = "screen-5";

  @override
  _CustomerContactState createState() => _CustomerContactState();
}

class _CustomerContactState extends State<CustomerContact> {


  Future<void> _readCustomerList() async{
    
  }

  TextEditingController fNameTextContoller;
  TextEditingController lNameTextContoller;
  TextEditingController cPhoneTextContoller;

  @override
  void initState() {
    fNameTextContoller = TextEditingController();
    lNameTextContoller = TextEditingController();
    cPhoneTextContoller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ],
      ),
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CreateCustomerDialog(
                  fNameController: fNameTextContoller,
                  lNameController: lNameTextContoller,
                  phoneController: cPhoneTextContoller,
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
