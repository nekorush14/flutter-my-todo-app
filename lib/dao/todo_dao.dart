import 'package:my_todo_app/entity/todo.dart';
import 'package:my_todo_app/services/database.dart';

class TodoDAO {
  final dbProvider = DatabaseService.dbProvider;
  final tableName = DatabaseService.todoTableName;

  Future<int> create(Todo todo) async {
    final db = await dbProvider.database;
    Future<int> result = db.insert(tableName, todo.toDBFormat());
    return result;
  }

  Future<List<Todo>> findAll() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result = await db.query(tableName);
    List<Todo> todos = result.isNotEmpty
        ? result.map((item) => Todo.fromDB(item)).toList()
        : [];
    return todos;
  }

  Future<int> update(Todo todo) async {
    final db = await dbProvider.database;
    int result = await db.update(tableName, todo.toDBFormat(),
        where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

  /// Delete the record
  /// Delete the data specified by [id]
  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    int result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  /// Delete the database
  Future deleteAll() async {
    final db = await dbProvider.database;
    int result = await db.delete(tableName);
    return result;
  }
}
