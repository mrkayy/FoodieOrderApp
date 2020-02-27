import 'package:flutter/material.dart';

const kDefaultFont = TextStyle(
  fontWeight: FontWeight.w300,
);

const kHeadingText = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 21.0,
  color: Colors.grey,
);
const kNumberInfo = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 36.0,
  color: Colors.grey,
);

const kLoginDecoration = InputDecoration(
  // filled: true,
  // fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    hintStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    focusColor: Colors.white,
    hintText: "Enter Password");