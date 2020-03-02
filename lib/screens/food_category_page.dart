import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/create_customer_dialog.dart';

class FoodCategoryPage extends StatefulWidget {
  static String id = "foodCatPage";
  @override
  _FoodCategoryPageState createState() => _FoodCategoryPageState();
}

class _FoodCategoryPageState extends State<FoodCategoryPage> {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Food Category",
          style: GoogleFonts.pacifico(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 0.25 * screenData.height,
              width: double.infinity,
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hello {User Name}\n',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontFamily: "WorkSans ",
                            color: Color(0xff3d3d3d),
                          ),
                        ),
                        TextSpan(
                          text: DateTime.now().toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "WorkSans ",
                            color: Color(0xff3d3d3d),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text('Food Settings'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return createCustomerDialog(key:scaffoldKey);
          },
        ),
      ),
    );
  }
}
