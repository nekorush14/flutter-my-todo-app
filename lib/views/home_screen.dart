import 'package:flutter/material.dart';
import 'package:my_todo_app/entity/todo.dart';
import 'package:my_todo_app/models/todo_list_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoList>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: _buildListView(model.list),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  ListView _buildListView(List<Todo> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            child: ListTile(
              title: Text(list[index].title),
            ),
          ),
        );
      },
    );
  }

  BottomAppBar _buildBottomAppBar() {
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
                  onPressed: () {},
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
                  onPressed: () {},
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
