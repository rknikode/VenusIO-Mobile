import 'package:sqflite/sqflite.dart';
import '../helpers/db_connection.dart';

class User {
  int id;
  String key;
  String date;
  Future<Database> database = DBConnection.getDBConnection();

  User({this.id, this.key, this.date});

  int get mapId => id;
  String get mapKey => key;
  String get mapDate => date;

  Future<int> deleteUser(int id) async {
    return await (await database)
        .delete("User", where: 'id = ?', whereArgs: [id]);
  }

  Future<void> addUser(User user) async {
    var result = await (await database).insert(
      "User",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // .rawInsert("INSERT INTO User (id,key,date) VALUES ($id,$key,$date)");
    return result;
  }

  getUser(id) async {
    List<Map> results = await (await database).query("User",
        columns: ["id", "key", "date"], where: 'id = ?', whereArgs: [id]);

    if (results.length > 0) {
      return new User.fromMap(results.first);
    }

    return null;
  }

  factory User.fromMap(Map<String, dynamic> data) => new User(
        id: data["id"],
        key: data["key"],
        date: data["date"],
      );

  Map<String, dynamic> toMap() => {"id": mapId, "key": mapKey, "date": mapDate};
}
