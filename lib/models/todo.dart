class Todo {
  String _title;
  String _details;
  bool _isDone;
  bool _isStared;

  Todo(this._title, this._details, this._isDone, this._isStared);

  String getTitle() {
    return this._title;
  }

  String getDetails() {
    return this._details;
  }

  bool isDone() {
    return this._isDone;
  }

  bool isStared() {
    return this._isStared;
  }

  void setTitle(String title) {
    this._title = title;
  }

  void setDetails() {
    this._details = _details;
  }

  void changeTodoDoneState(bool isDone) {
    this._isDone = isDone;
  }

  void changeTodoStarState(bool isStared) {
    this._isStared = isStared;
  }
}
