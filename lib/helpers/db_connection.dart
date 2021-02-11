import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBConnection {
  static Future<Database> getDBConnection() async {
    return openDatabase(
        // Set the path to the database.
        join((await getDatabasesPath()).toString(), 'venusIO.db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, key TEXT, date DATETIME)",
      );
    }, onOpen: (Database db) async {}, version: 1
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        );
  }
}
