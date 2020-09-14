import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:water_reminder/UI/Resources/data.dart';

class UserDatabaseProvider {
  UserDatabaseProvider._();
  Database _database;

  static final UserDatabaseProvider db = UserDatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "user.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id integer primary key AUTOINCREMENT,"
          "weight int,"
          "gender TEXT"
          ")");
    });
  }

  addUserToDatabase(User user) async {
    final db = await database;
    var raw = await db.insert(
      "User",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
}
