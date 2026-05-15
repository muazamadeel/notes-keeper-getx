import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'models/note.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  final String tableNote = 'note_table';
  final String colId = 'id';
  final String colTitle = 'title';
  final String colDescription = 'description';
  final String colPriority = 'priority';
  final String colDate = 'date';

  DatabaseHelper._privateConstructor();
  factory DatabaseHelper() =>
      _instance ??= DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'notes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableNote (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle TEXT,
        $colDescription TEXT,
        $colPriority INTEGER,
        $colDate TEXT
      )
    ''');
  }

  Future<int> insertNote(Note note) async {
    Database db = await database;
    return await db.insert(tableNote, note.toMap());
  }

  Future<int> updateNote(Note note) async {
    Database db = await database;
    return await db.update(
      tableNote,
      note.toMap(),
      where: '$colId = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    Database db = await database;
    return await db.delete(tableNote, where: '$colId = ?', whereArgs: [id]);
  }

  Future<List<Note>> getNotes() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      tableNote,
      orderBy: '$colPriority ASC',
    );
    return maps.map((e) => Note.fromMap(e)).toList();
  }
}
