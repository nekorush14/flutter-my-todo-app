import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';

class TodoDetailPage extends StatefulWidget {
  final Todo todo;

  TodoDetailPage({Key key, this.todo}) : super(key: key);

  @override
  _TodoDetailPageState createState() => _TodoDetailPageState(
      todo, todo.title, todo.details, todo.isDone, todo.isStared);
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  final Todo todo;
  String _todoTitle;
  String _todoDetail;
  bool _isDone = false;
  bool _isStared = false;

  _TodoDetailPageState(this.todo, this._todoTitle, this._todoDetail,
      this._isDone, this._isStared);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Text("Detail and edit"),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Todo title",
                  ),
                  initialValue: _todoTitle,
                  onChanged: (String value) {
                    setState(() {
                      _todoTitle = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: "Todo details",
                  ),
                  initialValue: _todoDetail,
                  onChanged: (String value) {
                    setState(() {
                      _todoDetail = value;
                    });
                  },
                ),
              ),
              new CheckboxListTile(
                value: _isDone,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "Done",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (bool value0) {
                  setState(() {
                    _isDone = value0;
                  });
                },
              ),
              new CheckboxListTile(
                value: _isStared,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "Important",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (bool value1) {
                  setState(() {
                    _isStared = value1;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: ButtonTheme(
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        todo.title = _todoTitle;
                        todo.details = _todoDetail;
                        todo.todoDoneState = _isDone;
                        todo.todoStarState = _isStared;
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "更新",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: ButtonTheme(
                    height: 50.0,
                    buttonColor: Colors.grey,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "キャンセル",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
