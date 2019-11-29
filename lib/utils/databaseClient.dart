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

  final String tableName = "newOrderTbl";
  final String columnId = "id";
  final String columnUserName = "userName";
  final String columnDateCreated = "dateCreated";
  final String columnOrderItem = "orderItem";
  final String columnOrderAmount = "orderAmount";
  final String columnQty = "qty";
  final String columnPhoneNum = "phoneNum";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "order_db.db");
    var myLocalDb = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int verison) async {
    await db.execute(
        "CREATE TABLE $tableName (id INTEGER PRIMARY KEY autoincrement, $columnDateCreated TEXT, $columnUserName TEXT, $columnPhoneNum TEXT, $columnOrderItem, ARRAY, $columnOrderAmount INT, $columnQty INT)");
  }

  //Insert in to local DB
  Future<int> saveOrder(PlaceOrder order) async {
    var dbClient = await db;
    int result = await dbClient.insert("tableName", order.toMap());
    return result;
  }

  Future<List> getDBdata() async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * $tableName ORDER BY $columnUserName ASC");
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<PlaceOrder> getOrders(int id) async {
    var dbClient = await db;
    var result =
        await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if (result.length == 0) return null;
    return new PlaceOrder.fromMap(result.first);
  }

  Future<int> deteteOrder(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableName, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> upDateOrder(PlaceOrder order) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", order.toMap(),
        where: "$columnId = ?", whereArgs: [order.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}
