import 'package:flutter/material.dart';

import '../database/databaseHelper.dart';
import '../controllers/profile_update.dart';
import '../models/user_profile.dart';

class ProfilePage extends StatefulWidget {
  static String id = "profile";
  final String currentUser;
  ProfilePage({this.currentUser});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DatabaseHelper db = DatabaseHelper();
  final GlobalKey<ScaffoldState> gkey = GlobalKey<ScaffoldState>();

  Future<UserProfile> _userProfile;

  void getUserProfile() async {
    setState(() {
      _userProfile = db.getUserProfile(widget.currentUser);
    });
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gkey,
      appBar: AppBar(
        title: Text(
          "Profile",
          // style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // constraints: BoxConstraints.expand(),s
          height: MediaQuery.of(context).size.height - 100.0,
          alignment: Alignment.center,
          child: FutureBuilder(
            future: _userProfile,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                return buildProfilePage(snapshot, gkey, context);
              }

              return Text('No Profile...');
            },
          ),
        ),
      ),
    );
  }

  Widget buildProfilePage(
      AsyncSnapshot db, GlobalKey gkey, BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -10.0,
          right: -10.0,
          top: -250.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.width * 1.5,
          ),
        ),
        Positioned(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(85.0)),
                  elevation: 3.0,
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      width: 150,
                      height: 150,
                      child: Icon(
                        Icons.person,
                        size: 50.0,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(height: 20.0),
                Text(
                  db.data.userName,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(db.data.fn),
                  subtitle: Text('First Name'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(db.data.phoneNumber),
                  subtitle: Text('Phone'),
                ),
                ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text('Not Approved'),
                  subtitle: Text('Account Status'),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) =>
                            updateUserProfile(userInfo: db.data, key: gkey));
                    getUserProfile();
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
