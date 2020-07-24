import 'package:equatable/equatable.dart';
import 'package:my_todo_app/models/todo.dart';

abstract class TodoListState extends Equatable {
  TodoListState([List props = const []]) : super(props);
}

class TodoListEmpty extends TodoListState {
  @override
  String toString() => 'TodoList:Empty';
}

class TodoListInProgress extends TodoListState {
  @override
  String toString() => 'TodoList:In_Progress';
}

class TodoListSuccess extends TodoListState {
  final Stream<List<Todo>> todoList;

  TodoListSuccess(this.todoList)
      : assert(todoList != null),
        super([todoList]);

  @override
  String toString() => 'TodoList:Success';
}

class TodoListFailure extends TodoListState {
  final Error error;

  TodoListFailure(this.error)
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'TodoList:Failure';
}
