import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/admin_info_card.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Foodie"),
        centerTitle: true,
      ),
      // drawer: Drawer(
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //         flex: 1,
      //         child: Container(
      //           color: Colors.yellowAccent,
      //           alignment: Alignment.center,
      //           child: Text("user"),
      //         ),
      //       ),
      //       Expanded(
      //         flex: 5,
      //         child: Container(
      //           alignment: Alignment.center,
      //           child: Text("items"),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
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
                        horizontal: 18.0, vertical: 10.0),
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
                    padding: const EdgeInsets.all(8.0),
                    // color: Colors.grey[400],
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int itemAt) {
                        return AdminInfoCard(
                          cardTitle: "food Category",
                          count: (3 + (itemAt * 5)).toString(),
                          pageId: "AdminSettingsPage.pageid",
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              // color: Colors.blue,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Notification"),
                  Text(DateTime.fromMillisecondsSinceEpoch(5000, isUtc: false)
                      .toString()),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    width: double.infinity,
                    height: 0.2 * scrData.height,
                    child: Card(
                      color: Colors.white,
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 15.0,
                          right: 15.0,
                          child: Icon(Icons.notifications),
                        ),
                        Text("data"),
                      ]),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    width: double.infinity,
                    height: 0.2 * scrData.height,
                    child: Text("data"),
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
