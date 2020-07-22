import 'package:flutter_test/flutter_test.dart';

import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/models/todo_list.dart';

void main() {
  Todo todo0, todo1, todo2;
  TodoList todoList;

  setUp(() {
    todoList = TodoList();
    todo0 = Todo("Test0", "Test discription");
    todo1 = Todo("Test1", "Test discription");
    todo2 = Todo("Test2", "Test discription");
    todoList.add(todo0);
    todoList.add(todo1);
    todoList.add(todo2);
  });

  group('Todolist model test', () {
    test('TodoList has 3 elements after adding 3 data', () {
      expect(3, todoList.length);
    });

    test('TodoList has 2 elements after remove 1 data', () {
      todoList.removeByIndex(0);

      expect(2, todoList.length);
    });

    test('TodoList has no element after remove all data', () {
      todoList.removeAll();

      expect(0, todoList.length);
    });
  });
}
