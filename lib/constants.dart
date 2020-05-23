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
      borderSide: BorderSide(color: Colors.black, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.circular(10.0))),
  focusColor: Colors.black,
  hintText: "Enter Password",
  hintStyle: TextStyle(color: Colors.black, fontSize: 13.0),
);
const kRegisterDecoration = InputDecoration(
  // filled: true,
  // fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(10.0))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(10.0))),
  focusColor: Colors.black,
  hintText: "Enter ",
  hintStyle: TextStyle(color: Colors.white),
);
