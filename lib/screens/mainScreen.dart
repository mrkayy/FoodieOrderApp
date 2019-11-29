import 'package:flutter/material.dart';

import 'homeScreen.dart';
import 'bookingScreen.dart';
import 'profileScreen.dart';

class MainScreen extends StatefulWidget {
  static String id = 'screen-1';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomeScreen(),
          OrderScreen(),
          ProfileScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          // labelPadding: EdgeInsets.symmetric(horizontal:20.0),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.settings)),
            // Tab(),
            // Tab(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
