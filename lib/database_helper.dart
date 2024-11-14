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

  Future<List<Map<String, dynamic>>> getAllDocuments() async {
    final db = await instance.database;
    return await db.query('documents');
  }

// Nouvelle fonction pour récupérer un document par son nom
  Future<List<Map<String, dynamic>>> getDocumentsByName(String fileName) async {
    final db = await instance.database;
    final result = await db.query(
      'documents',
      where: 'fileName = ?',
      whereArgs: [fileName],
    );
    return result;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // Incrémentez la version à 2 pour forcer la création de la nouvelle table
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // Création de la table "users"
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    // Création de la table "documents"
    await db.execute('''
      CREATE TABLE documents (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fileName TEXT NOT NULL,
        filePath TEXT NOT NULL,
        dateAdded TEXT NOT NULL
      )
    ''');
  }

  // Fonction pour insérer un document dans la table "documents"
  Future<int> insertDocument(String fileName, String filePath) async {
    final db = await instance.database;
    final dateAdded =
        DateTime.now().toIso8601String(); // Date actuelle formatée

    // Insertion dans la table "documents"
    final result = await db.insert(
      'documents',
      {
        'fileName': fileName,
        'filePath': filePath,
        'dateAdded': dateAdded,
      },
      conflictAlgorithm:
          ConflictAlgorithm.replace, // Remplace si un document existe déjà
    );
    return result;
  }

  // Vérifier si un document existe déjà dans la table "documents" (optionnel)
  Future<bool> documentExists(String fileName) async {
    final db = await instance.database;
    final result = await db.query(
      'documents',
      where: 'fileName = ?',
      whereArgs: [fileName],
    );
    return result.isNotEmpty;
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
