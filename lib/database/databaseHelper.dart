import 'package:foodie_user/database/databaseHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import '../models/customers.dart';
import '../models/customers.dart';

class DatabaseHelper {
  static DatabaseHelper databaseHelper;
  static Database db;
  DatabaseHelper._createInstance();

  //database tables
  String customerTable = 'cusomter'; //customer table
  String foodCategoryTable = 'foodCategory'; //food category list table
  String foodSubCategoryTable = 'foodSubCategory'; //food menu list table
  String orderTable = 'orderTable'; //order list table

  //database columns
  String colId = 'id';

  //food category list table parameter
  String colCategoryName = 'categoryName';

  //food subCategory list table parameter
  String colFoodName = 'foodName';
  String colFoodCategoryID = 'foodCategoryID';

  //customer table patameter
  String colFirstName = 'firstName';
  String colLastName = 'lastName';
  String colPhoneNum = 'phone';

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
    await db.execute('CREATE TABLE $customerTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colFirstName TEXT,'
        '$colLastName TEXT,'
        '$colPhoneNum TEXT'
        ')');
    await db.execute('CREATE TABLE $foodCategoryTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colCategoryName TEXT'
        ')');
    await db.execute('CREATE TABLE $foodSubCategoryTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colFoodName TEXT,'
        '$colFoodCategoryID TEXT'
        ')');
    await db.execute('''CREATE TABLE $orderTable
            (
              $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colDate TEXT,
            $colOrderId TEXT,
            $colOrderItemID TEXT,
            $colCustomerId TEXT,
            $colOrderStatus TEXT,
            $colOrderItemAmount TEXT
            )''');
  }

//////----<The below method deletes the entire database>----//////
  ///Get List of Customers
  Future<List<Customers>> getCustomers() async {
    Database db = await database;
    // var result = await db.rawQuery("SEKECT * FROM $customerTable");
    List<Map> maps = await db.query(customerTable,columns: [colFirstName,colLastName,colPhoneNum]);
    List<Customers> result = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        result.add(Customers.fromMap(maps[i]));
      }
    }
    return result;
  }

  ///Create a new Customer
  Future<Customers> insertCustomer(Customers customers) async {
    Database db = await database;
    // customers.id = await db.insert(customerTable, customers.toMap());
    db.insert(customerTable, customers.toMap());
    return customers;
  }

  //handles deleting database that was created
  Future<void> _deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  Future close() async {
    var db = await database;
    db.close();
  }
}
