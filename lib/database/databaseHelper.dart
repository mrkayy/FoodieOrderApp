import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper databaseHelper;
  static Database db;
  DatabaseHelper._createInstance();

  //database tables
  String customerTable = 'cusomter'; //customer table
  String foodCategoryTable = 'foodCategory'; //food category list table
  String foodSubCategoryTable = 'foodSubCategory'; //food menu list table
  String orderTable = 'order'; //order list table

  //database columns
  String colId = 'id';

  //food category list table parameter
  String colCategoryName = 'categoryName';

  //food subCategory list table parameter
  String colFoodName = 'foodName';
  String colFoodCategoryID = 'foodCategoryID';

  //customer table patameter
  String colFirstName = 'fName';
  String colLastName = 'lName';
  String colPhoneNum = 'cPhone';

  //order table column parameters
  String colDate = 'date';
  String colOrderId = 'orderId';
  String colOrderItemID = 'orderItem';
  String colCustomerId = 'customerId';
  String colOrderStatus = 'status';
  String colOrderItemAmount = 'orderItemAmount';

  factory DatabaseHelper() {
    if (databaseHelper == null) {
      databaseHelper = DatabaseHelper._createInstance();
    }
    return databaseHelper;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'foodie_database.db';

    //Open or create database at the given path
    var foodMenu =
        await openDatabase(path, version: 1, onCreate: createDatabase);
    return foodMenu;
  }

  //Initialize the database, opend the database and exposes the tables in database
  Future<Database> get database async {
    if (db == null) {
      db = await initializeDatabase();
    }
    return db;
  }

  createDatabase(Database db, int curVersion) async {
    await db
        .execute('CREATE TABLE $customerTable'
            '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colFirstName TEXT'
            '$colLastName TEXT'
            '$colPhoneNum TEXT'
            ')')
        .then((val) {
      print('customer table was created!');
    });
    await db
        .execute('CREATE TABLE $foodCategoryTable'
            '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colCategoryName TEXT'
            ')')
        .then((val) {
      print('Category table was created!');
    });
    await db
        .execute('CREATE TABLE $foodSubCategoryTable'
            '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colFoodName TEXT'
            '$colFoodCategoryID TEXT'
            ')')
        .then((val) {
      print('Food Menu table created!');
    });
    await db
        .execute('CREATE TABLE $orderTable'
            '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colDate TEXT'
            '$colOrderId TEXT'
            '$colOrderItemID TEXT'
            '$colCustomerId TEXT'
            '$colOrderStatus TEXT'
            '$colOrderItemAmount INT'
            ')')
        .then((val) {
      print('Order table created!');
    });
  }

//////----<The below method deletes the entire database>----//////


  //delete database from device
  Future deleteCustomerDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'customers.db';
    _deleteDatabase(path);
  }

  //handles deleting database that was created
  Future<void> _deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);
}
