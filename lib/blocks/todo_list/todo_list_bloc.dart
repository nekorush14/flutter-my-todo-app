import 'package:bloc/bloc.dart';
import 'package:my_todo_app/blocks/todo_list/todo_list_event.dart';
import 'package:my_todo_app/blocks/todo_list/todo_list_repository.dart';
import 'package:my_todo_app/blocks/todo_list/todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoListRepository _todoListRepository;

  TodoListBloc(this._todoListRepository);

  @override
  TodoListState get initialState => TodoListEmpty();

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    if (event is TodoListLoad) {
      yield* _mapEventToState();
    }
  }

  Stream<TodoListState> _mapEventToState() async* {
    yield TodoListInProgress();
    try {
      yield TodoListSuccess(_todoListRepository.fetch());
    } catch (_) {
      yield TodoListFailure(_);
    }
  }
}
