import 'package:flutter/material.dart';

notifiey({GlobalKey<ScaffoldState> key, IconData icons, String msg}) {
  return key.currentState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(icons),
          ),
          Text(msg),
        ],
      ),
    ),
  );
}
