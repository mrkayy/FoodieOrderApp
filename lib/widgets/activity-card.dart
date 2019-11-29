import 'package:flutter/material.dart';

class ActivityOverview extends StatelessWidget {
  final String entryTitle;
  final int totalEntry;
  final int completedEntry;

  const ActivityOverview(
      {Key key, this.entryTitle, this.totalEntry, this.completedEntry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 0.45 * scrWidth,
      padding: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(17.0))),
        // margin: EdgeInsets.only(right: 10.0),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                entryTitle,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: completedEntry.toString(),
                      style: TextStyle(color: Colors.black)),
                  TextSpan(text: "/", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: totalEntry.toString(),
                      style: TextStyle(color: Colors.black))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
