import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_stacked_demo/models/note.dart';
import 'package:stacked/stacked.dart';

class DatabaseService with ReactiveServiceMixin {
  static final DatabaseService instance = DatabaseService._internal();
  DatabaseService._internal();

  static Future<DatabaseService> getInstance() => Future.value(instance);

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('note.db');
    return _database!;
  }

  //opens the db or creates one if it doesn't already exist
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  ///creates a new database
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';

    //creates the notes table
    await db.execute('''
      CREATE TABLE $tableNotes (
        ${NoteFields.id} $idType,
        ${NoteFields.title} $textType,
        ${NoteFields.content} $textType
      )
    ''');
  }

  ///creates a single note
  Future<int> createNote(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return id;
  }

  ///gets all notes in db
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = '${NoteFields.id} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);
    return result.map((json) => Note.fromJson(json)).toList();
  }

  ///closes the db
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
