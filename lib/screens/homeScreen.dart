import 'package:flutter/material.dart';
import '../widgets/activity-card.dart';
import '../utils/demo-data.dart';

class HomeScreen extends StatefulWidget {
  static String id = "screen-2";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).accentColor,
                  ),
                  height: 0.08 * scrHeight,
                  width: 0.20 * scrWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 28.0,
                      ),
                      Text(
                        "4",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Today's Booking Activity Summary",style: TextStyle(fontWeight: FontWeight.bold),
          ),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 0.22 * scrWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activities.length, //TODO: Remove demo data item count
              itemBuilder: (BuildContext context, int index) {
                return ActivityOverview(
                  entryTitle: "Orders",
                  totalEntry: 10,
                  completedEntry: 5,
                );
              },
            ),
          ),
          SizedBox(height: 28.0),
          Expanded(child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
            return ActivityOverview(
              entryTitle: "Customer One",
              totalEntry: 90,
              completedEntry: 32,
            );
           },
          ),),
        ],
      ),),
    );
  }
}
