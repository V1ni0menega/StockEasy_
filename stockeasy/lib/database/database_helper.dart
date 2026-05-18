import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('stockeasy.db');

    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE produtos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        categoria TEXT NOT NULL,
        preco REAL NOT NULL,
        quantidade INTEGER NOT NULL,
        data_cadastro TEXT NOT NULL,
        ativo INTEGER NOT NULL
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> listarProdutos() async {
    final db = await instance.database;

    return await db.query("produtos");
  }

  Future<int> inserirProduto(Map<String, dynamic> produto) async {
    final db = await instance.database;

    return await db.insert('produtos', produto);
  }
  
}
