import 'package:flutter/material.dart';

import '../constants.dart';

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
      width: 0.43 * scrWidth,
      padding: EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        // margin: EdgeInsets.only(right: 10.0),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.event_note,
                size: 32.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      entryTitle,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: completedEntry.toString(),
                          style: kNotificationText),
                      TextSpan(text: "/", style: kNotificationText),
                      TextSpan(
                          text: totalEntry.toString(),
                          style: kNotificationText),
                    ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
