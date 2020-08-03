import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {
  TodoListEvent([List prop = const []]) : super(prop);
}

class TodoListLoad extends TodoListEvent {
  @override
  String toString() => 'TodoList:Load';
}
