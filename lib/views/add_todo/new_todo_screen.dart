import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';

class TodoAddPage extends StatefulWidget {
  TodoAddPage({Key key}) : super(key: key);

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  final String pageTitle = '追加';

  String _todoTitle = '';
  String _todoDetail = '';
  bool _isDone = false;
  bool _isStared = false;

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
                            Navigator.of(context).pop(Todo(
                                _todoTitle, _todoDetail,
                                isDone: _isDone, isStared: _isStared));
                          },
                          child: Text(
                            "作成",
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
      title: Text(this.pageTitle),
    );
  }
}
