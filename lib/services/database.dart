import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final _databaseVersion = 1;
  static final _databaseName = "todolist.db";
  static final todoTableName = "todolist";
  static final DatabaseService dbProvider = DatabaseService();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    Database database =
        await openDatabase(path, version: _databaseVersion, onCreate: initDB);
    return database;
  }

  void initDB(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $todoTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        details TEXT,
        is_stared INTEGER NOT NULL,
        is_done INTEGER NOT NULL
      )
    ''');
  }
}
