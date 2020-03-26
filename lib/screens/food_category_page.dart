import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/create_foodCategory_dialog.dart';
import '../database/databaseHelper.dart';
import '../controllers/snackbar_notifier.dart';
import '../models/food_category.dart';
import '../models/food_subcategory.dart';

class FoodCategoryPage extends StatefulWidget {
  static String id = "foodCatPage";
  @override
  _FoodCategoryPageState createState() => _FoodCategoryPageState();
}

class _FoodCategoryPageState extends State<FoodCategoryPage> {
  Future<List<FoodSubCategory>> subCategoryList;
  Future<List<FoodCategory>> categoryList;
  DatabaseHelper database;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void refreshFoodItemList() {
    setState(() {
      subCategoryList = database.getFoodSubCategory();
    });
  }

  void refreshCategoryItemList() {
    setState(() {
      categoryList = database.getFoodCategory();
    });
  }
  //   void getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userName = prefs.get("user_name");
  //   });
  // }

  @override
  void initState() {
    database = DatabaseHelper();
    // getUser();
    refreshCategoryItemList();
    super.initState();
  }

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
              // padding: const EdgeInsets.all(15.0),
              height: 0.29 * screenData.height,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Food Categories\n',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "WorkSans ",
                                  color: Color(0xff3d3d3d),
                                ),
                              ),
                              TextSpan(
                                text: '{32}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "WorkSans ",
                                  color: Color(0xff3d3d3d),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Food Menu\n',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "WorkSans ",
                                  color: Color(0xff3d3d3d),
                                ),
                              ),
                              TextSpan(
                                text: '{32}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "WorkSans ",
                                  color: Color(0xff3d3d3d),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Food Menu\n',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "WorkSans ",
                                  color: Color(0xff3d3d3d),
                                ),
                              ),
                              TextSpan(
                                text: '{32}',
                                style: TextStyle(
                                  fontSize: 18.0,
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
                  SizedBox(height: 8.0),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 100.0, //0.01 * screenData.height,
                          height: double.infinity,
                          child: InkWell(
                            onTap: () {
                              // showDialog(
                              //     barrierDismissible: false,
                              //     context: context,
                              //     builder: (BuildContext context) =>
                              //         createFoodCategoryDialog(
                              //             key: scaffoldKey));
                              // // .whenComplete(refreshCustomersList);
                            },
                            child: Card(
                              child: Center(child: Text('add')),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 0.09 * screenData.height,
                          child: FutureBuilder<List<FoodCategory>>(
                            future: categoryList,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 100,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Card(
                                          child: Center(
                                              child: Text(
                                                  snapshot.data[index].name)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                              return Center(
                                child: Text('no Category available!'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32.0)),
                ),
                child: FutureBuilder<List<FoodSubCategory>>(
                  future: subCategoryList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    notifiey(
                                        msg: 'feature disable',
                                        icons: Icons.warning,
                                        key: scaffoldKey);
                                  }),
                              leading: Icon(Icons.person),
                              title: Text(snapshot.data[index].fn),
                              subtitle: Text(snapshot.data[index].ln +
                                  ": " +
                                  snapshot.data[index].phoneNumber),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text(
                        'no food item available!',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       foodMenuList.addAll();
      //     }),
    );
  }
}
