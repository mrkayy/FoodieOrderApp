import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../controllers/create_foodCategory_dialog.dart';
// import '../models/food_subcategory.dart';
import '../components/food_listing_page.dart';
// import '../components/info_card.dart';
import '../components/richtext_infoCard.dart';
import '../controllers/create_foodCategory_dialog.dart';
import '../database/databaseHelper.dart';
// import '../controllers/snackbar_notifier.dart';
import '../models/food_category.dart';

class FoodCategoryPage extends StatefulWidget {
  static String id = "foodCatPage";
  @override
  _FoodCategoryPageState createState() => _FoodCategoryPageState();
}

class _FoodCategoryPageState extends State<FoodCategoryPage> {
  // Future<List<FoodSubCategory>> categoryList;
  Future<List<FoodCategory>> categoryList;
  DatabaseHelper database;
  int categoryCount;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // void refreshFoodItemList() {
  //   setState(() {
  //     subCategoryList = database.getFoodSubCategory();
  //   });
  // }

  void refreshCategoryItemList() {
    setState(() {
      categoryList = database.getFoodCategory();
    });
  }

  void getFoodCategoryCount() async {
    // setState(() async {
    categoryCount = await database.getFoodCategoryCount();
    // });
  }

  @override
  void initState() {
    database = DatabaseHelper();
    refreshCategoryItemList();
    getFoodCategoryCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Food Category",
          style: GoogleFonts.pacifico(),
        ),
        centerTitle: true,
      ),
      // constraints: BoxConstraints.expand(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            color: Colors.grey[100],
            height: 0.42 * screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 0.1 * screenSize.height,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        richTextInfoCard(
                            info: "$categoryCount", title: "Food Category"),
                        richTextInfoCard(info: "10", title: "Customer Order"),
                        richTextInfoCard(info: "3", title: "Completed"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'Food Category from: ',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 8),
                Text('Food Category from: ',
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.all(8.0),
          //   height: 0.21 * screenData.height,
          //   child: Card(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         richTextInfoCard(
          //             info: "$categoryCount", title: "Food Category"),
          //         richTextInfoCard(info: "10", title: "Customer Order"),
          //         richTextInfoCard(info: "3", title: "Completed"),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(18.0),
              child: FutureBuilder<List<FoodCategory>>(
                // child: FutureBuilder<List<FoodSubCategory>>(
                future: categoryList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => FoodListing(
                                      foodCategory: snapshot.data[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                // width: 120.0,
                                child: Column(
                                  children: [
                                    Text(snapshot.data[index].id.toString()),
                                    Text(snapshot.data[index].name),
                                    Text(snapshot.data[index].className),
                                    Text(snapshot.data[index].status
                                        ? 'Avaliable'
                                        : 'Out of order'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                  return Center(
                    child: Text('No Food Category Available!'),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.playlist_add),
          onPressed: () {
            showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) =>
                        createFoodCategoryDialog(key: scaffoldKey))
                .whenComplete(() {
              refreshCategoryItemList();
              getFoodCategoryCount();
            });
            // foodMenuList.addAll();
          }),
    );
  }
}
