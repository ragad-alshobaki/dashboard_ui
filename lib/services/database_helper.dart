import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:responsive_dashboard_ui/models/RecentFile.dart';

class DatabaseHelper {
  static Database? _database;

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

  Future<void> insertRecentFile(RecentFile file) async {
    final db = await database;
    await db.insert('recent_files', file.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<RecentFile>> getRecentFiles() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('recent_files');

    return List.generate(maps.length, (i) {
      return RecentFile(
        icon: maps[i]['icon'],
        title: maps[i]['title'],
        date: maps[i]['date'],
        size: maps[i]['size'],
      );
    });
  }
}
