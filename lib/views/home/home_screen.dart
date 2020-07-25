import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/views/add_todo/new_todo_screen.dart';
import 'package:my_todo_app/views/detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<HomeScreen> {
  final String pageTitle = 'My Todo';

  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Move to next page using push function
          // Get the todo content from TodoAddPage
          final Todo newTodo = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newTodo != null) {
            setState(() {
              todoList.add(newTodo);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Text(this.pageTitle),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return TodoDetailPage(todo: todoList[index]);
              }),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(todoList[index].title),
            ),
          ),
        );
      },
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.blue,
      child: Container(
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.list),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {});
                  },
                ),
                Text(
                  'Todo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.star),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {});
                  },
                ),
                Text(
                  'Stared',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
