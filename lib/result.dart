import 'database/database.dart';

class Result {
  DatabaseConnection databaseConnection = DatabaseConnection();
  var id;
  var name;
  resultMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['name'] = name;
    return mapping;
  }
}

