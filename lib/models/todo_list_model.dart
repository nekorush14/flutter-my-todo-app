import 'package:flutter/material.dart';
import 'package:my_todo_app/entity/todo.dart';
import 'package:my_todo_app/repository/todo_repository.dart';

class TodoList with ChangeNotifier {
  List<Todo> _todoList = [];
  final TodoRepository todoRepo = TodoRepository();

  List<Todo> get list => _todoList;
  List<Todo> get incompletedTodoList =>
      _todoList.where((todo) => todo.isDone == false).toList();
  List<Todo> get completedTodoList =>
      _todoList.where((todo) => todo.isDone == true).toList();

  void add(Todo todo) async {
    await todoRepo.insert(todo);
    _fetch();
  }

  void _fetch() async {
    _todoList = await todoRepo.findAll();
    notifyListeners();
  }
}
