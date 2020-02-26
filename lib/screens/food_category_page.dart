import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCategoryPage extends StatefulWidget {
  static String id = "foodCatPage";
  @override
  _FoodCategoryPageState createState() => _FoodCategoryPageState();
}

class _FoodCategoryPageState extends State<FoodCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Category",
          style: GoogleFonts.pacifico(),
        ),
        centerTitle: true,
      ),
    );
  }
}