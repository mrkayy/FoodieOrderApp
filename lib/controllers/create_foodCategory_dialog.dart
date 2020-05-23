import 'package:flutter/material.dart';

import 'snackbar_notifier.dart';
import '../models/food_category.dart';
import 'package:foodie_user/database/databaseHelper.dart';

final DatabaseHelper db = DatabaseHelper();

void createFoodCategory(
    {FoodCategory food, GlobalKey<ScaffoldState> scafKey}) async {
  if (food.name.isNotEmpty && food.className.isNotEmpty) {
    await db.createNewFoodCategory(food);
    notifiey(
      msg: "Food Category created succesfully.",
      key: scafKey,
      icons: Icons.thumb_up,
    );
  } else {
    notifiey(
      msg: 'Cannot create an empty food category!',
      icons: Icons.error_outline,
      key: scafKey,
    );
  }
}

Widget createFoodCategoryDialog({GlobalKey<ScaffoldState> key}) {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodClassController = TextEditingController();
  // final TextEditingController foodController = TextEditingController();

  return Builder(builder: (BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text("Create Food Category"),
      content: Container(
        height: 0.4 * scrData.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: foodNameController,
              decoration: InputDecoration(labelText: "Food Category Name"),
              // onChanged: (){},
            ),
            TextField(
              controller: foodClassController,
              decoration: InputDecoration(labelText: "Food Category Class"),
              // onChanged: (){},
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
            // FoodCategory foodCategory = FoodCategory(
            //     name: foodNameController.text,
            //     className: foodClassController.text);
            createFoodCategory(
                food: FoodCategory(
                  name: foodNameController.text,
                  className: foodClassController.text,
                ),
                scafKey: key);
            Navigator.of(context).pop();
          },
          child: Text('Ok'),
        ),
      ],
    );
  });
}
