import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/richtext_infoCard.dart';
import '../controllers/create_customer_dialog.dart';
import '../controllers/snackbar_notifier.dart';
import '../database/databaseHelper.dart';
import '../models/customers.dart';

class CustomerPage extends StatefulWidget {
  static String id = 'customers';
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  Future<List<Customers>> customerList;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String userName;

  DatabaseHelper database;
  var customerCount = 0;
  bool isUpdating = false;

  void refreshCustomersList() {
    setState(() {
      customerList = database.getCustomers();
    });
  }

  void getCustomerCount() {
    setState(() {
      customerCount = 0;
    });
  }

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.get("user_name");
    });
  }

  @override
  void initState() {
    database = DatabaseHelper();
    getUser();
    getCustomerCount();
    refreshCustomersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Customers",
          style: GoogleFonts.pacifico(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 0.25 * scrData.height,
            color: Colors.blueAccent,
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 0.12 * scrData.height,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                size: 32.0,
                                color: Colors.white,
                              )),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello:',
                                style: GoogleFonts.workSans(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                              TextSpan(
                                text: '\n$userName',
                                style: GoogleFonts.workSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 21.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.085 * scrData.height,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        richTextInfoCard(
                            info: "$customerCount", title: "Customers"),
                        richTextInfoCard(info: "10", title: "Customer Order"),
                        richTextInfoCard(info: "3", title: "Completed"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
              child: FutureBuilder<List<Customers>>(
                future: customerList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            trailing: IconButton(
                                icon: Icon(Icons.delete), onPressed: () {
                                  notifiey(msg:'feature disable',icons:Icons.warning,key:scaffoldKey);
                                }),
                            leading: Icon(Icons.person),
                            title: Text(snapshot.data[index].fn),
                            subtitle: Text(snapshot.data[index].ln +
                                ": " +
                                snapshot.data[index].phoneNumber),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text('no Customer available!'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => createCustomerDialog(key:scaffoldKey)).whenComplete(refreshCustomersList);
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
