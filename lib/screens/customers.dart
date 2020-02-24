import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerPage extends StatefulWidget {
  static String id = 'customers';
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  String userName;
  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.get("user_name");
    });
  }

  @override
  void initState() {
    getUser();
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
                child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[],
            )),
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.person_add)),
    );
  }
}
