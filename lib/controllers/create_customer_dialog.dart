import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../database/databaseHelper.dart';

import '../models/customers.dart';
import 'snackbar_notifier.dart';

final DatabaseHelper db = DatabaseHelper();

void createCustomer({Customers data, GlobalKey<ScaffoldState> scafKey}) async {
  if (data.phoneNumber.isNotEmpty && data.fn.isNotEmpty && data.ln.isNotEmpty) {
    await db.insertCustomer(data);
    notifiey(
      msg: "Customer created succesfull.",
      key: scafKey,
      icons: Icons.thumb_up,
    );
  }else{
  notifiey(
    msg: 'Customer details cannot be empty.',
    icons: Icons.error_outline,
    key: scafKey,
  );}
}

Widget createCustomerDialog({GlobalKey<ScaffoldState> key}) {
  TextEditingController fNameContoller = TextEditingController();
  TextEditingController lNameContoller = TextEditingController();
  TextEditingController phoneContoller = TextEditingController();

  return Builder(builder: (BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(
        'Create Customer',
        style: GoogleFonts.workSans(),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            Customers data = Customers(
              fn: fNameContoller.text,
              ln: lNameContoller.text,
              phoneNumber: phoneContoller.text,
            );
            fNameContoller.clear();
            lNameContoller.clear();
            phoneContoller.clear();

            createCustomer(data: data, scafKey: key);
            Navigator.of(context).pop();
          },
          child: Text('ok'),
        ),
      ],
      content: Container(
        height: 0.22 * scrData.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: fNameContoller,
              decoration: InputDecoration(labelText: "first Name"),
            ),
            TextField(
              controller: lNameContoller,
              decoration: InputDecoration(labelText: "last Name"),
            ),
            TextField(
              controller: phoneContoller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "phone number"),
            ),
          ],
        ),
      ),
    );
  });
}
