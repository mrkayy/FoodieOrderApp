import 'snackbar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:foodie_user/database/databaseHelper.dart';

import '../models/food_category.dart';

final DatabaseHelper db = DatabaseHelper();

void createFoodCategory(
    {FoodCategory data, GlobalKey<ScaffoldState> scafKey}) async {
  if (data.name.isNotEmpty) {
    // await db.createNewFoodCategory(data); 
    notifiey(
      msg: "Food Category created succesfully.",
      key: scafKey,
      icons: Icons.thumb_up,
    );
  } else {
    notifiey(
      msg: 'food details cannot be empty.',
      icons: Icons.error_outline,
      key: scafKey,
    );
  }
}

Widget createFoodCategoryDialog({GlobalKey<ScaffoldState> key}) {
  TextEditingController foodCategoryController = TextEditingController();

  return Builder(builder: (BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return AlertDialog(
      content: Container(
        height: 0.4 * scrData.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: foodCategoryController,
              decoration: InputDecoration(labelText: "Food Category Name"),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('cancel'),
        ),
        FlatButton(
          onPressed: () {
            FoodCategory foodCategory =
                FoodCategory(name: foodCategoryController.text);
            createFoodCategory(data: foodCategory, scafKey: key);
            Navigator.of(context).pop();
          },
          child: Text('Ok'),
        ),
      ],
    );
  });
}
