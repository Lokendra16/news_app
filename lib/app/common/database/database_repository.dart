import 'package:flutter/material.dart';
import 'package:news_app/app/networking/models/favourite/favourite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  Database? _database;
  static final DatabaseRepository instance = DatabaseRepository._init();

  DatabaseRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${'favourite'} ( 
  imageUrl , 
  title ,
   content ,
  isImportant )
''');
  }

  Future<void> insert({required Favourite favourite}) async {
    try {
      final db = await database;
      db.insert('favourite', favourite.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Favourite>> getAllTodos() async {
    final db = await instance.database;

    final result = await db.query('favourite');

    return result.map((json) => Favourite.fromJson(json)).toList();
  }
}
