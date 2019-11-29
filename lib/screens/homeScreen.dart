import 'package:flutter/material.dart';
import '../widgets/activity-card.dart';
import '../utils/demo-data.dart';
import '../widgets/orderOverview-card.dart';

class HomeScreen extends StatefulWidget {
  static String id = "screen-2";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Foodie",
                          style: TextStyle(color: Colors.black, fontSize: 28.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).accentColor,
                    ),
                    height: 0.08 * scrHeight,
                    width: 0.16 * scrWidth,
                    child: Icon(Icons.add, size: 28.0),
                    /*Row(
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "4",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ],
                    ),*/
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Today's Booking Activity Summary",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 0.22 * scrWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    activities.length, //TODO: Remove demo data item count
                itemBuilder: (BuildContext context, int index) {
                  return ActivityOverview(
                    entryTitle: "Orders",
                    totalEntry: 10,
                    completedEntry: 5,
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0,right: 20.0, bottom: 18.0),
              child: Text(
                "Today's order",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 0.48 * scrHeight,
              //  Expanded(
              // flex: 4,
              //TODO: Implement future builder for dataQuery
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return OrderOverView();
                },
              ),
            ),
            Container(
              //TODO: add total OrderOverview count indicator here
            ),
            // ),
          ],
        ),
      ),
      // bottom,
    );
  }
}
