import 'package:flutter/material.dart';
// import '../constants.dart';
// import '../models/foodItemList.dart';
// import '../widgets/foodItems.dart';
// import '../utils/bloc.dart';
import '../utils/demo-data.dart';
import '../widgets/customerDialogs.dart';

class FoodMenuScreen extends StatefulWidget {
  static String id = "screen-2";

  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  // List data;
  final List<String> foodList = [
    "RICE",
    "BEANS",
    "FISH",
    "SNACK",
    "DRINKS",
    "BUGGER",
    "SUSAGE",
    "WINE",
    "NOODLES",
    "DRINKS",
    "BUGGER",
    "SUSAGE",
    "WINE",
    "NOODLES"
  ];

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // color: Colors.grey[200],
              height: 0.18 * scrData.height,
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Demodata.foodCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Demodata.foodCategory[index];
                },
              ),
              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: Demodata.foodCategory,
              // ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text("Food Items"),
            ),

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(10.0),
                children: foodList
                    .map(
                      (food) => Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              builder: (BuildContext context) {
                                return new FoodItemsDialog(food);
                              },
                              context: context,
                            );
                          },
                          child: Container(
                            child: Center(
                              child: Text(food, style: null),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: DefaultAssetBundle.of(context)
            //         .loadString("load_json/foodlist.json"),
            //     // initialData: InitialData,
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       // var onData = JSON.decode(snapshot.data.toString());
            //       return GridView.count(
            //         crossAxisSpacing: 3.0,
            //         children: <Widget>[
            //           Card(
            //             elevation: 2.0,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(25.0))),
            //             child: InkWell(
            //               onTap: () {
            //                 showDialog(
            //                   builder: (BuildContext context) {
            //                     return new AddItemToPlate(snapshot.data);
            //                   },
            //                   context: context,
            //                 );
            //               },
            //               child: Container(
            //                 child: Center(
            //                   child: Text(snapshot.data, style: null),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ], crossAxisCount: snapshot.data.lenght,
            //       );
            //     },
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 15.0),
            //   height: 0.60 * scrData.height,
            //   child: Center(
            //     child: StreamBuilder(
            //       stream: foodItemBloc.foodItems,
            //       initialData: Demodata.foodItemList.toString(),
            //       builder: (BuildContext context, AsyncSnapshot snapshot) {
            //         return ListView.builder(
            //           itemCount: snapshot.data.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return FoodCateoryItem(
            //               // icon: snapshot.data[index].icon,
            //               itemName: snapshot.data[index],
            //               unitCost: snapshot.data[index],
            //             );
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
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
