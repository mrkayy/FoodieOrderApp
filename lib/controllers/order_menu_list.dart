import 'package:flutter/material.dart';

// import '../database/databaseHelper.dart';

import '../models/customers.dart';
// import 'snackbar_notifier.dart';

Widget createCustomerDialog({GlobalKey<ScaffoldState> key, Future<Customers> customerList }) {
  // TextEditingController fNameContoller = TextEditingController();
  // TextEditingController lNameContoller = TextEditingController();
  // TextEditingController phoneContoller = TextEditingController();

  return Builder(builder: (BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(
        'Select Customer',
        style:Theme.of(context).textTheme.subtitle.copyWith(),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
          //   Customers data = Customers(
          //     fn: fNameContoller.text,
          //     ln: lNameContoller.text,
          //     phoneNumber: phoneContoller.text,
          //   );
          //   fNameContoller.clear();
          //   lNameContoller.clear();
          //   phoneContoller.clear();

          //   createCustomer(data: data, scafKey: key);
            Navigator.of(context).pop();
          },
          child: Text('ok'),
        ),
      ],
      content: Container(
        height: 0.22 * screenSize.height,
        child: FutureBuilder(
                    future: customerList,
                    // initialData: InitialData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.active) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Column(
                              children: snapshot.data.map((e) {
                            return Text(e.fn);
                          }).toList());
                          // return ListView.builder(
                          //   itemCount: snapshot.data.length,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return Card(
                          //       child: ListTile(
                          //         onTap: () {
                          //           setState(() {
                          //             inCart = !inCart;
                          //           });
                          //         },
                          //         leading: Icon(Icons.fastfood),
                          //         trailing: IconButton(
                          //           icon: inCart
                          //               ? Icon(Icons.check)
                          //               : Icon(Icons.not_interested),
                          //           onPressed: () {
                          //             setState(() {
                          //               orderSubtotal();
                          //               orderedItems.add(OrderItems(
                          //                 orderID: 'foodie-012',
                          //                 customerID: '1',
                          //                 orderItemName:
                          //                     snapshot.data[index].name,
                          //                 foodCategotyID:
                          //                     snapshot.data[index].categoryID,
                          //                 orderItemAmount:
                          //                     snapshot.data[index].minPrice,
                          //               ));
                          //             });
                          //           },
                          //         ),
                          //         title: Text(snapshot.data[index].name),
                          //         subtitle: Text(
                          //           'NGN ${snapshot.data[index].minPrice.toString()}',
                          //           style:
                          //               Theme.of(context).textTheme.subhead,
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // );
                        }
                      }
                      return Center(
                        child: Text('No Food Category Available!'),
                      );
                    },
                  ),
      ),
    );
  });
}