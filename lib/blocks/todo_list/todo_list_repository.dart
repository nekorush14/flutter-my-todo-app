import 'package:my_todo_app/models/todo.dart';

abstract class TodoListRepository {
  Stream<List<Todo>> fetch();
}
