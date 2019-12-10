import 'package:flutter/material.dart';

class CustomerCheckList extends StatelessWidget {

  // final GlobalKey key;

  // const CustomerCheckList({Key key, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Container(
      width: 0.20 * scrData.width,
      child: CheckboxListTile(),
    );
  }
}