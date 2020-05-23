import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../database/databaseHelper.dart';
import '../models/customers.dart';
import '../models/food_subcategory.dart';
import '../models/order_items.dart';
import '../screens/checkout_page.dart';

class OrderPage extends StatefulWidget {
  static String id = "orderPage";
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<OrderItems> orderedItems = [];
  List<Customers> customerList = [];
  Future<List<FoodSubCategory>> foodListing;
  // FoodSubCategory foodsubCategory = FoodSubCategory();
  DatabaseHelper db;

  // List<double> subtotal = [];
  bool inCart = false;
  double orderAmount;
  double total = 0;

  void getCustomers() async {
    customerList = await db.getCustomers();
  }

  void foodforListing() {
    setState(() {
      foodListing = db.foodListingForOrder();
    });
  }

  void orderSubtotal() {
    total = 0.0;
    orderAmount = 0.0;
    // for (var i in orderedItems) {
    //   subtotal.add(i.orderItemAmount);
    // }
    // setState(() {
    // });
    orderedItems.forEach((e) => total += e.orderItemAmount);
    print(total);
  }

  @override
  void initState() {
    db = DatabaseHelper();
    foodforListing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Orders",
            style: GoogleFonts.pacifico(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenSize.height - 100.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 0.25 * screenSize.height,
                  width: screenSize.width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 0.155 * screenSize.height,
                        width: screenSize.width,
                        color: Colors.blueGrey[200],
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Customer Name: ',
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                            Text('data'),
                          ],
                        ),
                      ),
                      Positioned(
                        // top: 0.0,
                        left: 20,
                        right: 20,
                        bottom: 0.01 * screenSize.height,
                        child: Card(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            height: 0.12 * screenSize.height,
                            width: 0.9 * screenSize.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'ORDER DETAILS',
                                  style: Theme.of(context).textTheme.title,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Order Items:',
                                      style:
                                          Theme.of(context).textTheme.subtitle,
                                    ),
                                    Container(
                                      width: 80.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            Icons.add_shopping_cart,
                                            size: 20.0,
                                          ),
                                          Text(
                                            '${orderedItems.length}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Subtotal:',
                                      style:
                                          Theme.of(context).textTheme.subtitle,
                                    ),
                                    Container(
                                      width: 80.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'NGN',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .copyWith(
                                                  color: Colors.green[500],
                                                ),
                                          ),
                                          Text(
                                            '$total',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .copyWith(
                                                  color: Colors.green[500],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ExpansionPanel(
                //     headerBuilder: (Text('Order Items')),
                //     body: Column(children: <Widget>[])),
                Expanded(
                  child: Container(
                    child: FutureBuilder(
                      future: foodListing,
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
                            // return Column(
                            //     children: snapshot.data.map((e) {
                            //   return Text(e.name);
                            // }).toList);
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        inCart = !inCart;
                                      });
                                    },
                                    leading: Icon(Icons.fastfood),
                                    trailing: IconButton(
                                      icon: inCart
                                          ? Icon(Icons.check)
                                          : Icon(Icons.not_interested),
                                      onPressed: () {
                                        setState(() {
                                          orderSubtotal();
                                          orderedItems.add(OrderItems(
                                            orderID: 'foodie-012',
                                            customerID: '1',
                                            orderItemName:
                                                snapshot.data[index].name,
                                            foodCategotyID:
                                                snapshot.data[index].categoryID,
                                            orderItemAmount:
                                                snapshot.data[index].minPrice,
                                          ));
                                        });
                                      },
                                    ),
                                    title: Text(snapshot.data[index].name),
                                    subtitle: Text(
                                      'NGN ${snapshot.data[index].minPrice.toString()}',
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }
                        return Center(
                          child: Text('No Food Category Available!'),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                    child: MaterialButton(
                  height: screenSize.height * 0.07,
                  minWidth: screenSize.width,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CheckputPage(order: orderedItems)));
                  },
                  child: Text('CheckOut'),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
