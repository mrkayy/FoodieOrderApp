import 'snackbar_notifier.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:foodie_user/database/databaseHelper.dart';

import '../models/food_category.dart';
import '../models/food_subcategory.dart';

final DatabaseHelper db = DatabaseHelper();

void createCustomer({FoodCategory data, GlobalKey<ScaffoldState> scafKey}) async {
  if (data.name.isNotEmpty) {
    // await db.createNewFoodCategory(data);
    notifiey(
      msg: "Food Category created succesfully.",
      key: scafKey,
      icons: Icons.thumb_up,
    );
  }
  notifiey(
    msg: 'Customer details cannot be empty.',
    icons: Icons.error_outline,
    key: scafKey,
  );
}

Widget createCustomerDialog({GlobalKey<ScaffoldState> key}) {
  return Builder(builder: (BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('ok'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('ok'),
        ),
      ],
    );
  });
}
