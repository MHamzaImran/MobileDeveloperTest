import 'package:sqflite/sqflite.dart';
import 'database/database.dart';

class Repository {
  final DatabaseConnection _databaseConnection = DatabaseConnection();
  static Database? _database;

  Future<Database> get database async =>
      _database ??= await _databaseConnection.setDatabase();

  insertData(table, data) async {
    data['id'] = null;
    var connection = await database;
    var result = await connection.insert(table, data);
    return result;
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  deleteData(table, itemId) async {
    var connection = await database;
    return await connection.rawDelete('DELETE FROM $table WHERE id = $itemId');
  }

  deleteAllData(table) async {
    var connection = await database;
    return await connection.rawDelete('DELETE FROM $table ');
  }



}