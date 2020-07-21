import 'package:my_todo_app/models/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Todo todo;

  setUp(() {
    todo = Todo("Test", "Test discription");
  });

  group('Todo default value test', () {
    test('Default Done state of todo should be false', () {
      expect(false, todo.isDone);
    });

    test('Default Stared state of todo should be false', () {
      expect(false, todo.isStared);
    });
  });
}
