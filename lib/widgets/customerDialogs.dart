import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class FoodItemsDialog extends StatelessWidget {

  String _food;
  FoodItemsDialog(this._food);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        height: 0.4 * MediaQuery.of(context).size.height,
        child: Center(
          child: Text("$_food"),
        ),
      ),
    );
  }
}

class CreateCustomerDialog extends StatelessWidget {
  final TextEditingController fNameController;
  final TextEditingController lNameController;
  final TextEditingController phoneController;

  CreateCustomerDialog(
      {this.fNameController, this.lNameController, this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        // color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 28.0),
        height: 0.48 * MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Customer Info",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            TextField(
              controller: fNameController,
              autofocus: true,
              // focusNode: Next,
              decoration: InputDecoration(
                labelText: 'FistName',
                labelStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500)
              ),
            ),
            TextField(
              controller: lNameController,
              decoration: InputDecoration(
                labelText: 'LastName',
                labelStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500)
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "add",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 20.0),
                FlatButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "cancel",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
