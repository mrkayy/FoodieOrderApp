import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/orders.dart';
import '../models/food_category.dart';
import '../components/admin_info_card.dart';
import '../database/databaseHelper.dart';
import '../components/drawer_menu.dart';

class Dashboard extends StatefulWidget {
  static String id = 'screen_1';
  final currentuser;

  Dashboard({this.currentuser});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String userName;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Future<List<FoodOrder>> order;
  List<FoodCategory> foodMenu = [];
  List<String> emptyMenu = ['no food category found!'];
  final DatabaseHelper db = DatabaseHelper();

  void getFoodOrder() async {
    setState(() {
      // order = db.();
    });
  }

  getFoodMenu() async {
    foodMenu = await db.getFoodCategory();
  }

  @override
  void initState() {
    // getUser();
    getFoodMenu();
    getFoodOrder();
    super.initState();
  }

  @override
  void dispose() {
    // db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Foodie",
          style: GoogleFonts.pacifico().copyWith(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: BuildDrawerMenu(displayName: widget.currentuser.user),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    // height: MediaQuery.of(context).size.height * 0.36,
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Hello',
                                  style: Theme.of(context).textTheme.display1),
                              TextSpan(text: '\n'),
                              TextSpan(
                                  text: '${widget.currentuser.user}',
                                  style: Theme.of(context).textTheme.title),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Card(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: screenSize.height * 0.205,
                    // margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    padding: const EdgeInsets.all(10.0),
                    // color: Colors.grey[400],
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int itemAt) {
                        return AdminInfoCard(
                          cardTitle: "food Category",
                          count: (3 + (itemAt * 5)).toString(),
                        );
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'What would you like today?',
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                    Wrap(
                        runSpacing: 2.0,
                        spacing: 2.0,
                        direction: Axis.horizontal,
                        children: foodMenu.isEmpty
                            ? emptyMenu
                                .map(
                                  (e) => Container(
                                    child: Text('$e'),
                                  ),
                                )
                                .toList()
                            : foodMenu
                                .map(
                                  (item) => Column(
                                    children: <Widget>[
                                      Card(
                                        elevation: 15.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Container(
                                          height: 80.0,
                                          width: 80.0,
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.fastfood),
                                              Text('Menu: ${item.name}'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        '${item.className}',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      )
                                    ],
                                  ),
                                )
                                .toList()),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Today\'s Order'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      height: screenSize.height * 0.31,
                      child: FutureBuilder(
                        future: order,
                        // initialData: InitialData,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasError) {
                              return Text('Error occured!!!');
                            }
                            return CircularProgressIndicator();
                          }
                          return ListView.builder(
                            itemBuilder: (_, index) {
                              return Card(
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  child: Text('data'),
                                ),
                              );
                            },
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
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
      ),
      /*
    Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Foodie", style: GoogleFonts.pacifico()),
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      endDrawer: BuildDrawerMenu(displayName: widget.currentuser.user),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Welcome',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 11.0)),
                          // TextSpan(text: '\n'),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: '${widget.currentuser.user}',
                            style: GoogleFonts.workSans(
                                color: Colors.black, fontSize: 21.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 101.0,
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    // color: Colors.grey[400],
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int itemAt) {
                        return AdminInfoCard(
                          cardTitle: "food Category",
                          count: (3 + (itemAt * 5)).toString(),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    width: 0.87 * scrData.width,
                    height: 0.25 * scrData.height,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 20.0,
                            left: 20.0,
                            child: Text(
                              "Order Notifications",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Positioned(
                            top: 15.0,
                            right: 15.0,
                            child: Icon(Icons.notifications,
                                color: Theme.of(context).accentColor),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 2.0,
                            child: Container(
                              width: 0.83 * scrData.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10.0),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "Orders\n",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.0)),
                                          TextSpan(
                                            text: "20",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10.0),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "Customers\n",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.0)),
                                          TextSpan(
                                            text: "20",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10.0),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "Completed\n",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.0)),
                                          TextSpan(
                                            text: "20",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Container(
                      // color: Colors.blue[400],
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      alignment: Alignment.center,
                      width: double.infinity,
                      // height: 0.355 * scrData.height,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 5.0,
                        runSpacing: 5.0,
                        children: <Widget>[
                          Container(
                            width: 0.42 * scrData.width,
                            height: 80,
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProfilePage(
                                            currentUser:
                                                widget.currentuser.user,
                                          ))),
                              child: Card(
                                child: Center(
                                  child: Text("Profile"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.42 * scrData.width,
                            height: 80,
                            child: InkWell(
                              onTap: () =>
                                  Navigator.of(context).pushNamed(OrderPage.id),
                              child: Card(
                                child: Center(
                                  child: Text("Orders"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.42 * scrData.width,
                            height: 80,
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(FoodCategoryPage.id),
                              child: Card(
                                child: Center(
                                  child: Text("Food Category"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.42 * scrData.width,
                            height: 80,
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(CustomerPage.id),
                              child: Card(
                                child: Center(
                                  child: Text(CustomerPage.id),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 80,
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(RecordsPage.pageid),
                              child: Card(
                                child: Center(
                                  child: Text("Records"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    */
    );
  }
}
