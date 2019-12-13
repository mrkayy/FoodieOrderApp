import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/foodItemList.dart';
import '../widgets/foodItems.dart';
import '../utils/bloc.dart';
import '../utils/demo-data.dart';

class FoodMenuScreen extends StatefulWidget {
  static String id = "screen-2";

  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  @override
  void dispose() {
    super.dispose();
    // foodItemBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Food Order'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // color: Colors.grey[200],
                height: 0.18 * scrData.height,
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Demodata.foodCategory,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: Text("Food Items"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                height: 0.60 * scrData.height,
                child: Center(
                  child: StreamBuilder(
                    stream: foodItemBloc.foodItems,
                    initialData: Demodata.foodItemList.toString(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodCateoryItem(
                            // icon: snapshot.data[index].icon,
                            itemName: snapshot.data[index],
                            unitCost: snapshot.data[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
