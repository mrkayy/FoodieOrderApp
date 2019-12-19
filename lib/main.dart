import 'package:flutter/material.dart';

import './screens/customerScreen.dart';
import './screens/homeScreen.dart';
import './screens/splashScreen.dart';
import './screens/orderScreen.dart';
import './screens/foodMenuScreen.dart';
import './screens/profileScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Order',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        // accentColor: Colors.black,
        // brightness: Brightness.dark,
      ),
      initialRoute: MainScreen.id,
      routes: <String, WidgetBuilder>{
        HomeScreen.id: (BuildContext context) => HomeScreen(),
        StartScreen.id: (BuildContext context) => StartScreen(),
        MainScreen.id: (BuildContext context) => MainScreen(),
        ProfileScreen.id: (BuildContext context) => ProfileScreen(),
        FoodMenuScreen.id: (BuildContext context) => FoodMenuScreen(),
        CustomerContact.id: (BuildContext context) => CustomerContact(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  static String id = 'screen-0';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          HomeScreen(),
          FoodMenuScreen(),
          OrderScreen(),
          CustomerContact(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        child: Container(
          color: Colors.grey[100],
          child: TabBar(
            // labelPadding: EdgeInsets.symmetric(horizontal:20.0),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).accentColor,
            labelColor: Theme.of(context).accentColor,
            controller: _tabController,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.local_pizza)),
              Tab(icon: Icon(Icons.content_paste)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
              // Tab(),
              // Tab(),
            ],
          ),
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
