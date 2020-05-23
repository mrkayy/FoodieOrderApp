import 'package:flutter/material.dart';

import '../screens/customers.dart';
import '../screens/order_page.dart';
import '../screens/profile_page.dart';
import '../screens/records_page.dart';
import '../screens/splash_screen.dart';
import '../screens/food_category_page.dart';

import '../models/user_authentication.dart';
import '../database/databaseHelper.dart';

class BuildDrawerMenu extends StatelessWidget {
  final String displayName;
  final DatabaseHelper db = DatabaseHelper();
  // final  user = UserAuthentication(
  //             user: displayName,
  //             loginState: false,);

  BuildDrawerMenu({this.displayName});

  void signout(BuildContext context) async {
    await db
        .signoutUser(UserAuthentication(
      user: displayName,
      loginState: false,
    ))
        .whenComplete(() {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed(SplashScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.face,
                    size: 42.0,
                  ),
                ),
                Text(
                  '$displayName',
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Total Earned: \$0.00',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints.expand(),
              padding: const EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   colorFilter:
                  //       ColorFilter.mode(Colors.grey, BlendMode.softLight),
                  //   // image: AssetImage('assets/images/moneyBackground.jpg'),
                  //   fit: BoxFit.fitHeight,
                  // ),
                  ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage(
                              currentUser: displayName,
                            ))),
                  ),
                  ListTile(
                    leading: Icon(Icons.room_service),
                    title: Text('My Orders'),
                    onTap: () => Navigator.of(context).pushNamed(OrderPage.id),
                  ),
                  ListTile(
                    leading: Icon(Icons.fastfood),
                    title: Text('Food Category'),
                    onTap: () =>
                        Navigator.of(context).pushNamed(FoodCategoryPage.id),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text('Customers'),
                    onTap: () =>
                        Navigator.of(context).pushNamed(CustomerPage.id),
                  ),
                  ListTile(
                    leading: Icon(Icons.show_chart),
                    title: Text('Records'),
                    onTap: () =>
                        Navigator.of(context).pushNamed(RecordsPage.pageid),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Color(0xff2d2d2d),
            height: 80,
            child: ListTile(
              leading: Icon(Icons.close, color: Colors.redAccent),
              title: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.redAccent),
              ),
              onTap: () {
                signout(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
