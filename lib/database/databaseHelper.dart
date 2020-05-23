import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import '../models/customers.dart';
import '../models/food_category.dart';
import '../models/food_subcategory.dart';
import '../models/user_profile.dart';
import '../models/user_authentication.dart';

class DatabaseHelper {
  static DatabaseHelper databaseHelper;
  static Database db;
  DatabaseHelper._createInstance();

  //database tables
  String customerTable = 'cusomter'; //customer table
  String foodCategoryTable = 'foodCategory'; //food category list table
  String foodSubCategoryTable = 'foodSubCategory'; //food menu list table
  String orderTable = 'orderTable'; //order list table
  String orderItemTable = 'orderItemTable';
  String loginTable = 'logins';
  String userProfile = 'userprofile';

  //database columns
  String colId = 'id';

  //Login columns
  String colUserName = 'user';
  String colPassword = 'password';
  String colloginState = 'loginState';

  //food category list table parameter
  String colStatus = 'status';
  String colCategoryName = 'categoryName';
  String colCategoryClass = 'className';

  //food subCategory list table parameter
  String colFoodName = 'foodName';
  String colFoodCategoryID = 'foodCategoryID';
  String colMinPrice = 'minimumPrice';
  String colIsAvaliable = 'isAvaliable';

  //customer table patameter
  String colFirstName = 'firstName';
  String colLastName = 'lastName';
  String colPhoneNum = 'phone';

  //order table column parameters
  String colDate = 'date';
  String colOrderId = 'orderId';
  String colOrderItemID = 'orderItemId';
  String colOrderStatus = 'status';
  String colOrderTotalAmount = 'orderTotalAmount';

  // order item table column parameters
  String colCustomerId = 'customerId';
  // String colFoodItemId = 'foodItem';
  // String colFoodCategoryID ='';
  String colOrderItem = 'orderItemName';
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
    await db.execute('''
      CREATE TABLE $loginTable
      (
       $colId INTEGER PRIMARY KEY AUTOINCREMENT,
       $colUserName TEXT,
       $colPassword TEXT,
       $colloginState INTEGER
      )''');

    await db.execute('''
    CREATE TABLE $userProfile(
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colFirstName TEXT,
      $colUserName TEXT,
      $colPhoneNum TEXT
    )''');

    await db.execute('CREATE TABLE $customerTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colFirstName TEXT,'
        '$colLastName TEXT,'
        '$colPhoneNum TEXT'
        ')');
    await db.execute('CREATE TABLE $foodCategoryTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colStatus INTEGER,'
        '$colCategoryName TEXT,'
        '$colCategoryClass TEXT'
        ')');
    await db.execute('CREATE TABLE $foodSubCategoryTable'
        '($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colFoodName TEXT,'
        '$colMinPrice REAL,'
        '$colFoodCategoryID TEXT,'
        '$colIsAvaliable INTEGER'
        ')');
    await db.execute('''CREATE TABLE $orderTable(
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colDate TEXT,
            $colOrderId TEXT,
            $colOrderItemID TEXT,
            $colOrderStatus TEXT,
            $colOrderTotalAmount REAL
            )''');
    await db.execute(''' CREATE TABLE $orderItemTable(
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colCustomerId TEXT,
            $colFoodCategoryID TEXT,
            $colOrderItem TEXT,
            $colOrderItemAmount REAL
            )''');
  }

//////----<The below method deletes the entire database>----//////
  //Create userprofile
  Future<void> createUserProfile(var user) async {
    // print('creating user profile...');
    // print('firstName: ${user.fn}');
    // print('userName: ${user.userName}');
    // print('number: ${user.phoneNumber} \n');
    Database db = await database;
    await db.insert(userProfile, user.toMap());
  }

  Future<UserProfile> getUserProfile(String user) async {
    Database db = await database;
    List<UserProfile> profile = [];
    var map = await db.query(userProfile,
        columns: [colId, colUserName, colFirstName, colPhoneNum],
        where: '$colUserName = ?',
        whereArgs: [user]);
    profile.add(UserProfile.fromMap(map.first));

    return profile.first;
  }

  Future<void> updateUserProfile({var user, String oldProfile}) async {
    Database db = await database;
    print('profile Name: ${user.fn}');
    print('profile userName: ${user.userName}');
    print('profile phone: ${user.phoneNumber}');
    print('\n\n');

    // await db.update(
    //     userProfile,
    //     {
    //       // colId: user.id,
    //       colFirstName: user.fn,
    //       colUserName: user.userName,
    //       colPhoneNum: user.phoneNumber
    //     },
    //     where: '$colUserName = ?',
    //     whereArgs: [oldProfile]);
  }

  Future<void> updataUserAuthentication(
      {String newProfile, String oldProfile}) async {
    print('NewProfile: $newProfile');
    print('oldProfile: $oldProfile');
    // Database db = await database;
    // await db.update(
    //     loginTable,
    //     {
    //       colUserName: newProfile,
    //     },
    //     where: '$colUserName = ?',
    //     whereArgs: [oldProfile]);
  }

  Future<int> createUserAuthentication(var auth) async {
    // print('creating authentication credentials...');
    // print('userName: ${auth.user}');
    // print('password: ${auth.password}');
    // print('loginStatus: ${auth.loginState} \n');

    Database db = await database;
    var result = await db.insert(loginTable, auth.toMap());
    return result;
  }

  Future<void> signinUser(var user) async {
    // print("USER: ${user.id}");
    // print("USER: ${user.user}");
    // print('PASSWORD: ${user.password}');
    // print('LOGINSTATE: ${user.loginState}');
    // print('signin complete! \n');

    Database db = await database;
    await db.update(loginTable, {colloginState: user.loginState},
        where: '$colUserName = ?', whereArgs: [user.user]);
  }

  Future<void> signoutUser(var user) async {
    // print("ID: ${user.id}");
    // print("USER: ${user.user}");
    // print('PASSWORD: ${user.password}');
    // print('LOGINSTATE: ${user.loginState}');
    // print('signout complete! \n');

    Database db = await database;
    await db.update(loginTable, {colloginState: user.loginState},
        where: '$colUserName = ?', whereArgs: [user.user]);
  }

  Future<List<UserAuthentication>> getUserCredentials(String user) async {
    Database db = await database;
    var maps = await db.query(loginTable,
        columns: [colId, colUserName, colPassword, colloginState],
        where: '$colUserName = ?',
        whereArgs: [user]);

    // print('logging authentication diagnosis');
    // print('userfounnd: ${maps.elementAt(0)['$colUserName']}');
    // print('passwordfound: ${maps.elementAt(0)['$colPassword']}');
    // print('loginstatusfound: ${maps.elementAt(0)['$colloginState']}\n\n');

    List<UserAuthentication> result = [];
    if (maps.length > 0) {
      for (var f in maps) {
        result.add(UserAuthentication.fromMap(f));
      }
    }
    return result;
  }

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

  ////////----<FoodCategory queries>----////////
  Future<int> getFoodCategoryCount() async {
    Database db = await database;
    List<Map<String, dynamic>> c =
        await db.rawQuery('''SELECT COUNT(*) FROM $foodCategoryTable''');
    var result = Sqflite.firstIntValue(c);
    return result;
  }

  Future<List<FoodCategory>> getFoodCategory() async {
    Database db = await database;
    var maps = await db.query(foodCategoryTable,
        columns: [colId, colStatus, colCategoryName, colCategoryClass]);
    List<FoodCategory> result = [];
    if (maps.length > 0) {
      for (var f in maps) {
        result.add(FoodCategory.fromMap(f));
      }
    }
    return result;
  }

  Future<int> createNewFoodCategory(dynamic food) async {
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

  Future<int> getFoodSubCategoryCount() async {
    Database db = await database;
    List<Map<String, dynamic>> c =
        await db.rawQuery('''SELECT COUNT(*) FROM $foodSubCategoryTable''');
    var result = Sqflite.firstIntValue(c);
    return result;
  }

  Future<int> createFoodSubCategory(FoodSubCategory foodSub) async {
    Database db = await database;
    print('foodCategoryID: ${foodSub.categoryID}');
    print('foodName: ${foodSub.name}');
    print('foodAmount: ${foodSub.minPrice}');
    print('foodAmount: ${foodSub.isAvaliable}');
    var result = await db.insert(foodSubCategoryTable, foodSub.toMap());
    return result;
  }

  Future<List<FoodSubCategory>> foodListingForOrder() async {
    Database db = await database;
    var maps = await db.query(foodSubCategoryTable, columns: [
      colId,
      colFoodName,
      colFoodCategoryID,
      colMinPrice,
      colIsAvaliable
    ]);
    List<FoodSubCategory> result = [];
    if (maps.length > 0) {
      for (var f in maps) {
        result.add(FoodSubCategory.fromMap(f));
      }
    }
    return result;
  }

  Future<List<FoodSubCategory>> getFoodSubCategory(int id) async {
    Database db = await database;
    var maps = await db.query(foodSubCategoryTable,
        columns: [
          colId,
          colFoodName,
          colFoodCategoryID,
          colMinPrice,
          colIsAvaliable
        ],
        where: '$colFoodCategoryID = ?',
        whereArgs: [id]);
    List<FoodSubCategory> result = [];
    if (maps.length > 0) {
      for (var f in maps) {
        result.add(FoodSubCategory.fromMap(f));
      }
    }
    return result;
  }

  Future<void> updateFoodSubCategory(FoodSubCategory food) async {
    Database db = await database;
    await db.update(foodSubCategoryTable, food.toMap(),
        where: '$colId = ?', whereArgs: [food.id]);
  }

  Future close() async {
    var db = await database;
    db.close();
  }
}
