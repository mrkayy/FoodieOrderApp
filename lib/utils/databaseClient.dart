import 'dart:async';
import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/order.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _database;
/*
  static final DatabaseHelper _databaseHelper;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() => 
  
  {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }*/

  final String tableName = "newOrderTbl";
  final String columnId = "id";
  final String columnUserName = "userName";
  final String columnDateCreated = "dateCreated";
  final String columnOrderItem = "orderItem";
  final String columnOrderAmount = "orderAmount";
  // final String columnQty = "qty";
  final String columnPhoneNum = "phoneNum";

  DatabaseHelper.internal();

  Future<Database> get database async {
    if (_database = null) {
      // return _database;
      _database = await initDb();
    }
    return _database;
  }

  //funciton initializes the database
  Future<Database> initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "orders.db");
    var orderDatabase =
        await openDatabase(path, version: 1, onCreate: _createOrderDB);

    return orderDatabase;
  }

//funcition creates order database after initialization
  void _createOrderDB(Database db, int verison) async {
    await db.execute(
        "CREATE TABLE $tableName (id INTEGER PRIMARY KEY autoincrement, $columnDateCreated TEXT, $columnUserName TEXT, $columnPhoneNum TEXT, $columnOrderItem, ARRAY, $columnOrderAmount INT)");
  }

  //Insert in to local DB
  Future<int> saveOrder(PlaceOrder order) async {
    Database db = await this.database;
    // var dbClient = await db;
    int result = await db.insert(tableName, order.toMap());
    return result;
  }

  Future<List> getOrderList() async {
    Database db = await this.database;
    var result = await db
        .rawQuery("SELECT * $tableName ORDER BY $columnUserName ASC");
    return result.toList();
  }

  Future<int> getCount() async {
    Database dbClient = await this.database;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<PlaceOrder> getOrders(int id) async {
    Database dbClient = await this.database;
    var result =
        await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if (result.length == 0) return null;
    return new PlaceOrder.fromMap(result.first);
  }

  Future<int> deteteOrder(int id) async {
    // var dbClient = await db;
    Database dbClient = await this.database;
    return await dbClient
        .delete(tableName, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> upDateOrder(PlaceOrder order) async {
    // var dbClient = await db;
    Database dbClient = await this.database;
    return await dbClient.update("$tableName", order.toMap(),
        where: "$columnId = ?", whereArgs: [order.id]);
  }

  Future close() async {
    // var dbClient = await db;
    Database dbClient = await this.database;
    return dbClient.close();
  }
}
