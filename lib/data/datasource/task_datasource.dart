import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/utils/db_keys.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();

  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DBKeys.dbTable}(
          ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DBKeys.titleColumn} TEXT,
          ${DBKeys.noteColumn} TEXT,
          ${DBKeys.dateColumn} TEXT,
          ${DBKeys.timeColumn} TEXT,
          ${DBKeys.categoryColumn} TEXT,
          ${DBKeys.isCompletedColumn} INTEGER
        )
    ''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return await db.insert(
        DBKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update(
      DBKeys.dbTable,
      task.toJson(),
      where: '${DBKeys.idColumn} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return await db.delete(
      DBKeys.dbTable,
      where: '${DBKeys.idColumn} = ?',
      whereArgs: [task.id],
    );
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.query(
      DBKeys.dbTable,
      orderBy: 'id DESC',
    );
    return List.generate(data.length, (index) => Task.fromJson(data[index]));
  }
}
