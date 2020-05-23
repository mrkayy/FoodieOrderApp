import 'package:flutter/material.dart';
import 'package:foodie_user/components/richtext_infoCard.dart';

// import '../components/info_card.dart';
import '../controllers/snackbar_notifier.dart';
import '../database/databaseHelper.dart';
import '../models/food_category.dart';
import '../models/food_subcategory.dart';

class FoodListing extends StatefulWidget {
  final FoodCategory foodCategory;
  FoodListing({this.foodCategory});
  @override
  _FoodListingState createState() => _FoodListingState();
}

class _FoodListingState extends State<FoodListing> {
  Future<List<FoodSubCategory>> foodListing;
  DatabaseHelper database;
  FoodSubCategory foodsubCategory = FoodSubCategory();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String foodCategoryID;

  void refreshFoodList(int arg) {
    setState(() {
      foodListing = database.getFoodSubCategory(arg);
    });
  }

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
    refreshFoodList(widget.foodCategory.id);
    foodCategoryID = '${widget.foodCategory.id}';
  }

  void createFood() async {
    var formValue = formKey.currentState;
    if (formValue.validate()) {
      formValue.save();
      foodsubCategory.categoryID = foodCategoryID;
      await database.createFoodSubCategory(foodsubCategory).whenComplete(() {
        FocusScope.of(context).requestFocus(new FocusNode());
        formValue.reset();
        refreshFoodList(widget.foodCategory.id);
        notifiey(
          msg: "Food Item created succesfully.",
          key: scaffoldKey,
          icons: Icons.thumb_up,
        );
      }).catchError((onError) {
        print(onError);
        notifiey(
          msg: "$onError",
          key: scaffoldKey,
          icons: Icons.warning,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('${widget.foodCategory.name} List'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 83.0,
            child: Column(
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
                              richTextInfoCard(info: "0", title: "Count"),
                              richTextInfoCard(info: "6", title: "Sold"),
                              richTextInfoCard(info: "3", title: "Avaliable"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Food Category from: ${widget.foodCategory.name}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: 8),
                      Text(
                          'Food Category from: ${widget.foodCategory.className}',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(25.0),
                    child: FutureBuilder<List<FoodSubCategory>>(
                      future: foodListing,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    leading: Icon(Icons.fastfood),
                                    title: Text(snapshot.data[index].name),
                                    trailing: Text(
                                      'NGN ${snapshot.data[index].minPrice.toString()}',
                                      style:
                                          Theme.of(context).textTheme.subhead,
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
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    color: Colors.grey[100],
                    height: 180.0,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            validator: (e) =>
                                e.isEmpty ? 'enter name of food!' : null,
                            onSaved: (val) => foodsubCategory.name = val,
                            decoration:
                                InputDecoration(labelText: 'Name of Food'),
                          ),
                          TextFormField(
                            validator: (e) =>
                                e.isEmpty ? 'enter a minimum price!' : null,
                            onSaved: (val) =>
                                foodsubCategory.minPrice = double.tryParse(val),
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(labelText: 'Minimum Price'),
                          ),
                          FlatButton(
                            // color: Colors.grey,
                            padding: const EdgeInsets.all(22.0),
                            onPressed: () {
                              createFood();
                            },
                            child: Text('Create'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
