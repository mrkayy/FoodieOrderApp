import 'package:flutter/material.dart';

import '../screens/orderManagementScreen/ordermanagment.dart';
import '../widgets/orderStateCard.dart';
import 'orderManagementScreen/orderForm.dart';

class OrderScreen extends StatefulWidget {
  static String id = "screen-3";
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  // final TextEditingController _textController = TextEditingController();

  // void _submitOrder(String text) {}

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // _textController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Order Booking Manager"),
                  Icon(Icons.notifications), //TODO: add proper notification
                ],
              ),
            ),
            SizedBox(height: 28.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OrderManagmentCard(
                    title: "Completed",
                    count: "5",
                  ),
                  OrderManagmentCard(
                    title: "Pending",
                    count: "10",
                  ),
                  OrderManagmentCard(
                    title: "Cancelled",
                    count: "4",
                  ),
                  OrderManagmentCard(
                    title: "All Order",
                    count: "19",
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                color: Colors.grey[300],
                child: TabBar(
                  // labelPadding: EdgeInsets.symmetric(horizontal:20.0),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).accentColor,
                  labelColor: Theme.of(context).accentColor,
                  indicatorWeight: 2.5,
                  controller: _tabController,
                  tabs: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 15.0),
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 15.0),
                        child: Text(
                          "Compelete",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 15.0),
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
                      child: Text(
                        "Cancelled",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Tab(),
                    // Tab(),
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                AllOrders(),
                CompletedOrder(),
                PendingOrder(),
                CancelledOrder(),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, CreateOrder.id), //_placeOrderDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
