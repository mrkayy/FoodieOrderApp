import 'package:flutter/material.dart';
import '../utils/demo-data.dart';
// import '../widgets/activity-card.dart';

class HomeScreen extends StatefulWidget {
  static String id = "screen-1";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0,bottom:28.0,),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Foodie",
                      style: TextStyle(color: Colors.black, fontSize: 28.0),
                    ),
                    //TODO: Add user name to UI & welcome note
                  ],
                ),
              ),
            ),
            // SizedBox(height: 28.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Quick Access",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 0.24 * scrData.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    Demodata.activities.length, //TODO: Remove demo data item count
                itemBuilder: (BuildContext context, int index) {
                  return Demodata.activities[index];
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
              height: 0.50 * scrData.height,
              //  Expanded(
              // flex: 4,
              //TODO: Implement future builder for dataQuery
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Demodata.orderOverview.length,
                itemBuilder: (BuildContext context, int index) {
                  return Demodata.orderOverview[index];
                },
              ),
            ),
            // SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28.0,vertical: 10.0),
              child: Center(child:Text("indicator goes here")),
            ),
          ],
        ),
      ),
      // bottom,
    );
  }
}
