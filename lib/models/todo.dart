class Todo {
  int _id = 0;
  String _title = '';
  String _details = '';
  bool _isDone = false;
  bool _isStared = false;

  Todo(this._id, this._title, this._details,
      {bool isDone = false, bool isStared = false}) {
    this._isDone = isDone;
    this._isStared = _isStared;
  }

  int get id => this._id;

  String get title => this._title;

  String get details => this._details;

  bool get isDone => this._isDone;

  bool get isStared => this._isStared;

  set title(String title) => this._title = title;

  set details(String details) => this._details = _details;

  set todoDoneState(bool isDone) => this._isDone = isDone;

  set todoStarState(bool isStared) => this._isStared = isStared;
}
