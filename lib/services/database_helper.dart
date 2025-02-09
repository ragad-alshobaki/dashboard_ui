import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:responsive_dashboard_ui/models/RecentFile.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'recent_files';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'recent_files.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE recent_files (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            icon TEXT,
            title TEXT,
            date TEXT,
            size TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertRecentFile(List<RecentFile> files) async {
    final db = await database;
    // await db.insert('recent_files', file.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    for (var file in files) {
      //await dbHelper.insertRecentFile(file);  **if need to load one file at time
      await db.insert('recent_files', file.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    final List<Map<String, dynamic>> existingFiles =
        await db.query('recent_files');

    if (existingFiles.isEmpty) {
      for (var file in files) {
        await db.insert('recent_files', file.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
  }

  Future<List<RecentFile>> getRecentFiles() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('recent_files');

    return maps.map((map) => RecentFile.fromMap(map)).toList();
  }
}
