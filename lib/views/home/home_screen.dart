import 'package:flutter/material.dart';
import 'package:my_todo_app/views/add_todo/new_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<HomeScreen> {
  final String pageTitle = 'My Todo';

  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Move to next page using push function
          // Get the todo content from TodoAddPage
          final newTodoTitle = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newTodoTitle != null) {
            setState(() {
              todoList.add(newTodoTitle);
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
        return Card(
          child: ListTile(
            title: Text(todoList[index]),
          ),
        );
      },
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
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
                  onPressed: () {
                    setState(() {});
                  },
                ),
                Text('Todo'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.star),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                Text('Pined'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
