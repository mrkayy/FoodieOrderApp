import 'package:flutter/material.dart';

class AdminInfoCard extends StatelessWidget {
  final String cardTitle;
  final String count;
  final String pageId;

  const AdminInfoCard({Key key, this.cardTitle, this.count, this.pageId});

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Container(
      width: 0.3 * scrData.height,
      child: GestureDetector(
        onTap: ()=>Navigator.of(context).pushNamed(pageId),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(cardTitle.toUpperCase()),
                Divider(
                  thickness: 2.0,
                  endIndent: 10.0,
                  indent: 2.0,
                  color: Theme.of(context).primaryColorDark,
                ),
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "You have ceated $count $cardTitle",
                          style:
                              TextStyle(fontSize: 11.0, color: Colors.black)),
                      TextSpan(
                          text: "\ntap to create more.",
                          style: TextStyle(fontSize: 9.0, color: Colors.blue)),
                    ],
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
