import 'package:my_todo_app/dao/todo_dao.dart';
import 'package:my_todo_app/entity/todo.dart';

class TodoRepository {
  final TodoDAO todoDAO = TodoDAO();

  Future findAll() => todoDAO.findAll();
  Future insert(Todo todo) => todoDAO.create(todo);
  Future update(Todo todo) => todoDAO.update(todo);
  Future deleteById(int id) => todoDAO.delete(id);
  Future deleteAll() => todoDAO.deleteAll();
}
