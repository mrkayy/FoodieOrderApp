import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/admin_info_card.dart';
import './records_page.dart';
import './customers.dart';
import './food_category_page.dart';
import './order_page.dart';
import './profile_page.dart';

class Dashboard extends StatefulWidget {
  static String id = 'screen_1';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Foodie"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                            text: 'User-Name',
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
                            width: 152,
                            height: 80,
                            child: InkWell(
                              onTap: () =>Navigator.of(context).pushNamed(ProfilePage.id),
                              child: Card(
                                child: Center(
                                  child: Text("Profile"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 152,
                            height: 80,
                            child: InkWell(
                              onTap: () =>Navigator.of(context).pushNamed(OrderPage.id),
                              child: Card(
                                child: Center(
                                  child: Text("Orders"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 152,
                            height: 80,
                            child: InkWell(
                              onTap: () =>Navigator.of(context).pushNamed(FoodCategoryPage.id),
                              child: Card(
                                child: Center(
                                  child: Text("Food Category"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 152,
                            height: 80,
                            child: InkWell(
                              onTap: () =>Navigator.of(context).pushNamed(CustomerPage.id),
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
                              onTap: () =>Navigator.of(context).pushNamed(RecordsPage.pageid),
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
  }
}
