import '../models/customers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class CustomerDatabaseHelper {
  static CustomerDatabaseHelper _databaseHelper;

  static Database _database;

  String customerTable = 'new_customer_table';
  String colId = 'id';
  String colFirstName = 'fName';
  String colLastName = 'lName';
  String colPhoneNum = 'phone';
  String colDate = 'dateCreated';

  CustomerDatabaseHelper._createInstance();

  factory CustomerDatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = CustomerDatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'newcustomer.db';

    var newCustomer = await openDatabase(path, version: 1, onCreate: _createDB);

    return newCustomer;
  }

  void _createDB(Database db, int curVersion) async {
    await db.execute(
        'CREATE TABLE $customerTable($colId INTEGER PRIMARY KEY AUTOINCREMANT,'
        '$colFirstName TEXT,$colLastName TEXT,$colPhoneNum TEXT,$colDate Text)');
  }

  //Fetch Operation: Get all Customer
  Future<List<Map<String, dynamic>>> getCustomerMapList() async {
    Database db = await this.database;

    var result = await db
        .rawQuery('SELECT * FROM $customerTable order by $colFirstName ASC');
    return result;
  }

  //Insert Operation: Store New Customer to Database
  Future<int> insertCustomer(CreateCustomer customer) async {
    Database db = await this.database;
    var result = await db.insert(customerTable, customer.toMap());
    return result;
  }

  //Update Operation: Update Existing Customer to Database
  Future<int> iupdateCustomer(CreateCustomer customer) async {
    var db = await this.database;
    var result = await db.update(customerTable, customer.toMap(),
        where: '$colId = ?', whereArgs: [customer.id]);
    return result;
  }

  //Delete Operation:
  Future<int> deleteCustomer(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $customerTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $customerTable');
    int result = Sqflite.firstIntValue(x);

    return result;
  }
}
