import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/databaseHelper.dart';
import '../models/customers.dart';

class CustomerPage extends StatefulWidget {
  static String id = 'customers';
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  Future<List<Customers>> customerList;
  final createCustomerFormKey = GlobalKey<FormState>();
  String userName;
  String firstName;
  String lastName;
  String phoneNum;
  var database;
  bool isUpdating = false;

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.get("user_name");
    });
  }

  void createNewCustomer() {
    if (createCustomerFormKey.currentState.validate()) {
      createCustomerFormKey.currentState.save();
      Customers c = Customers(
        // id: 0,
        fn: firstName,
        ln: lastName,
        phoneNumber: phoneNum,
      );
      if (!isUpdating) {
        database.insertCustomer(c);
      } else {
        print(firstName);
        print(lastName);
        print(phoneNum);
      }
    }
  }

  void refreshCustomersList() {
    setState(() {
      customerList = database.getCustomers();
    });
  }

  @override
  void initState() {
    database = DatabaseHelper();
    getUser();
    refreshCustomersList();
    print(database.getCustomers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
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
                                text: 'User Name:',
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
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '30\n',
                                style: GoogleFonts.workSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0),
                              ),
                              TextSpan(
                                text: 'Contacts',
                                style: GoogleFonts.workSans(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '30\n',
                                style: GoogleFonts.workSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0),
                              ),
                              TextSpan(
                                text: 'Contacts',
                                style: GoogleFonts.workSans(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '30\n',
                                style: GoogleFonts.workSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0),
                              ),
                              TextSpan(
                                text: 'Contacts',
                                style: GoogleFonts.workSans(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: customerList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(snapshot.data[index].fn,),
                            trailing: Text(snapshot.data[index].ln,),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text('no Customer available!'),
                    // CircularProgressIndicator(
                    //   backgroundColor: Color(0xff3D3D3D),
                    // ),
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
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Create Customer'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  FlatButton(
                    onPressed: () {
                      createNewCustomer();
                      Navigator.of(context).pop();
                    },
                    child: Text('ok'),
                  ),
                ],
                content: Column(
                  children: <Widget>[
                    Form(
                      key: createCustomerFormKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "first Name"),
                            validator: (val) {
                              var s =
                                  val.length > 0 ? null : "enter customer name";
                              return s;
                            },
                            onSaved: (val) {
                              return firstName = val;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "last Name"),
                            validator: (val) {
                              var s =
                                  val.length > 0 ? null : "enter customer name";
                              return s;
                            },
                            onSaved: (val) {
                              return lastName = val;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration:
                                InputDecoration(labelText: "phone number"),
                            validator: (val) {
                              var s = val.length > 11
                                  ? "enter customer name"
                                  : null;
                              return s;
                            },
                            onSaved: (val) {
                              return phoneNum = val;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              barrierDismissible: false,
            ).whenComplete(refreshCustomersList);
          },
          child: Icon(Icons.person_add)),
    );
  }
}
