import 'package:flutter/material.dart';

import '../models/food_subcategory.dart';
import 'snackbar_notifier.dart';


void createFoodSubCategory(
    {FoodSubCategory data, GlobalKey<ScaffoldState> scafKey}) async {
  if (data.name.isNotEmpty) {
    // await db.createNewFoodCategory(data);
    notifiey(
      msg: "Food Item created succesfully.",
      key: scafKey,
      icons: Icons.thumb_up,
    );
  }
  notifiey(
    msg: 'food details cannot be empty.',
    icons: Icons.error_outline,
    key: scafKey,
  );
}
