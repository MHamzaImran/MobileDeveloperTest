import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqflite');
    var database =
    await openDatabase(path, version: 1, onCreate: onCreatingDatabase);
    return database;
  }

  onCreatingDatabase(Database database, int version) async {
    await database.execute(
        'CREATE TABLE skills(id INTEGER PRIMARY KEY,name TEXT)');
  }
}