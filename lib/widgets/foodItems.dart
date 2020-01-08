import 'package:flutter/material.dart';
import 'customerDialogs.dart';

class FoodCateoryItem extends StatelessWidget {
  // final String foodCategory;
  // final IconData icon;
  final String itemName;
  final String unitCost;

  FoodCateoryItem({
    this.itemName,
    // this.icon,
    this.unitCost,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context){
            return ;//;FoodItemsDialog(itemName);
          }
        );
      },
      leading: Icon(Icons.local_pizza),
      trailing: Icon(Icons.edit),
      title: Text(itemName),
      subtitle: Text("NGN $unitCost"),
    );
  }
}

class AddItemToPlate extends StatelessWidget {
  final String _foodItemName;

  const AddItemToPlate(this._foodItemName);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("How much \"$_foodItemName\" do you want?"),
      content: Text("add UI design"),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[Text("add ui design")],
      // ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("add"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          child: Text("cancel"),
        ),
      ],
    );
  }
}
