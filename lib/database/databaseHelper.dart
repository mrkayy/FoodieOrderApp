import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import '../models/customers.dart';
import '../models/food_category.dart';
import '../models/food_subcategory.dart';

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
    await db.execute('CREATE TABLE $foodCategoryTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colCategoryName TEXT'
        ')');
    await db.execute('CREATE TABLE $customerTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colFirstName TEXT,'
        '$colLastName TEXT,'
        '$colPhoneNum TEXT'
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
  ///Get total customer in database
  Future<int> getCustomerCount() async {
    Database db = await database;
    List<Map<String, dynamic>> c =
        await db.rawQuery('''SELECT COUNT(*) FROM $customerTable''');
    var result = Sqflite.firstIntValue(c);
    return result;
  }

  ///Create a new Customer
  Future<int> insertCustomer(Customers customers) async {
    Database db = await database;
    // customers.id = await db.insert(customerTable, customers.toMap());
    var result = db.insert(customerTable, customers.toMap());
    return result;
  }

  ///Get List of Customers
  Future<List<Customers>> getCustomers() async {
    Database db = await database;
    var maps = await db.query(customerTable,
        columns: [colId, colFirstName, colLastName, colPhoneNum]);
    List<Customers> result = [];
    if (maps.length > 0) {
      for (var c in maps) {
        result.add(Customers.fromMap(c));
      }
    }
    return result;
  }

////----<end>---////
  ///
  ///
  ///
  ////////----<FoodCategory queries>----////////
  Future<List<FoodCategory>> getFoodCategory() async {
    Database db = await database;
    var maps =
        await db.query(foodCategoryTable, columns: [colId, colCategoryName]);
    List<FoodCategory> result = [];
    if (maps.length > 0) {
      for (var f in maps) {
        result.add(FoodCategory.fromMap(f));
      }
    }
    return result;
  }

  Future<int> getFoodCategoryCount() async {
    Database db = await database;
    List<Map<String, dynamic>> c =
        await db.rawQuery('''SELECT COUNT(*) FROM $foodCategoryTable''');
    var result = Sqflite.firstIntValue(c);
    return result;
  }

  Future<int> createNewFoodCategory(FoodCategory food) async {
    Database db = await database;
    var result = db.insert(foodCategoryTable, food.toMap());
    return result;
  }

  Future<void> updateFoodCategory(FoodCategory food) async {
    Database db = await database;
    await db.update(foodCategoryTable, food.toMap(),
        where: '$colId = ?', whereArgs: [food.id]);
  }

//TODO: add delete function

  Future<List<FoodSubCategory>> getFoodSubCategory() async {
    Database db = await database;
    var maps = await db.query(foodSubCategoryTable,
        columns: [colId, colFoodName, colFoodCategoryID]);
    List<FoodSubCategory> result = [];
    if (maps.length > 0) {
      for (var f in maps) {
        result.add(FoodSubCategory.fromMap(f));
      }
    }
    return result;
  }

  Future<int> createFoodSubCategory(FoodSubCategory foodSub) async {
    Database db = await database;
    var result = await db.insert(foodSubCategoryTable, foodSub.toMap());
    return result;
  }

  Future<int> getFoodSubCategoryCount() async {
    Database db = await database;
    List<Map<String, dynamic>> c =
        await db.rawQuery('''SELECT COUNT(*) FROM $foodSubCategoryTable''');
    var result = Sqflite.firstIntValue(c);
    return result;
  }

  Future close() async {
    var db = await database;
    db.close();
  }
}
