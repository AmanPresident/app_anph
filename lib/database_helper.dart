import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<bool> emailExists(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  Future<bool> loginUser(String login, String password) async {
    final db = await instance.database;

    // Exécuter la requête SQL pour vérifier si l'utilisateur existe
    final result = await db.query(
      'users',
      where: '(username = ? OR email = ?) AND password = ?',
      whereArgs: [login, login, password],
    );

    // Vérifier si un résultat est retourné (utilisateur trouvé)
    return result.isNotEmpty;
  }
}
