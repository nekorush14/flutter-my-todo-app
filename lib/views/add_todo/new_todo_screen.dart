import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';

class TodoAddPage extends StatefulWidget {
  final Todo todo;

  TodoAddPage({Key key, this.todo}) : super(key: key);

  @override
  _TodoAddPageState createState() => _TodoAddPageState(this.todo);
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _pageTitle = '追加';
  String _acceptButton = '作成';
  Todo todo;
  String _todoTitle = '';
  String _todoDetail = '';
  bool _isDone = false;
  bool _isStared = false;

  _TodoAddPageState(this.todo) {
    if (this.todo != null) {
      this._pageTitle = '更新';
      this._acceptButton = '更新';
      this._todoTitle = todo.title;
      this._todoDetail = todo.details;
      this._isDone = todo.isDone;
      this._isStared = todo.isStared;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
              Column(
                children: [
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
                    value: this._isStared,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      "Important",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (bool value1) {
                      setState(() {
                        this._isStared = value1;
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
                            if (this.todo == null) {
                              todo = Todo(_todoTitle, _todoDetail,
                                  isDone: _isDone, isStared: _isStared);
                              Navigator.of(context).pop(this.todo);
                            } else {
                              todo.title = _todoTitle;
                              todo.details = _todoDetail;
                              todo.todoDoneState = _isDone;
                              todo.todoStarState = _isStared;
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            this._acceptButton,
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
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Text(this._pageTitle),
    );
  }
}
