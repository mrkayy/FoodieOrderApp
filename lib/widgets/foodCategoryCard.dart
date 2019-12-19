import 'package:flutter/material.dart';
import '../constants.dart';
// import '../widgets/foodItems.dart';

class FoodItemCard extends StatelessWidget {
  final String categoryName;
  final IconData icon;

  FoodItemCard({
    @required this.categoryName,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // final scrData = MediaQuery.of(context).size;
    return Container(
      // height: 0.10 * scrData.height,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            elevation: 4.0,
            fillColor: Colors.white,
            constraints: BoxConstraints.tightFor(height: 66.0, width: 66.0),
            shape: CircleBorder(),
            child: Icon(icon),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodCateoryItem(foodCategory: categoryName,)));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(categoryName, style: kNotificationText),
          )
        ],
      ),
    );
  }
}
