import 'package:flutter/material.dart';

class PlaceOrder extends StatelessWidget {
  int _id;
  int _qty;
  int _orderAmount;
  String _userName;
  String _dateCreated;
  String _phoneNum;
  List<String> _orderItem;

  PlaceOrder(
    this._orderAmount,
    this._dateCreated,
    this._orderItem,
    this._phoneNum,
    this._userName,
    this._qty,
  );

  PlaceOrder.map(dynamic obj) {
    this._qty = obj["qty"];
    this._userName = obj["userName"];
    this._orderAmount = obj["orderAmount"];
    this._orderItem = obj["orderItem"];
    this._dateCreated = obj["dateCreated"];
    this._phoneNum = obj["phoneNum"];
    this._id = obj["id"];
  }

  String get userName => userName;
  int get orderAmount => orderAmount;
  String get orderItem => orderItem;
  String get dateCreated => dateCreated;
  int get qty => qty;
  String get phoneNum => phoneNum;
  int get id => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["userName"] = _userName;
    map["orderAmount"] = _orderAmount;
    map["orderItem"] = _orderItem;
    map["dateCreated"] = _dateCreated;
    map["phoneNum"] = _phoneNum;
    map["qty"] = _qty;

    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  PlaceOrder.fromMap(Map<String, dynamic> map){
    this._orderItem = map["orderItem"];
    this._orderAmount = map["orderAmount"];
    this._phoneNum = map["phoneNumber"];
    this._qty = map["qty"];
    this._userName = map["userName"];
    this._dateCreated = map["dateCreated"];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
