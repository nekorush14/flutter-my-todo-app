class Todo {
  int _id;
  String _title;
  String _details;
  bool _isStared;
  bool _isDone;

  Todo(int id, String title, String details, bool isStared, bool isDone) {
    this._id = id;
    this._title = title;
    this._details = details;
    this._isStared = isStared;
    this._isDone = isDone;
  }

  int get id => this._id;
  String get title => this._title;
  String get details => this._details;
  bool get isStared => this._isStared;
  bool get isDone => this._isDone;

  factory Todo.fromDB(Map<String, dynamic> data) => Todo(
        data['id'],
        data['title'],
        data['detail'],
        data['isStared'],
        data['is_done'] == 1 ? true : false,
      );

  Map<String, dynamic> toDBFormat() => {
        "id": this._id,
        "title": this._title,
        "details": this._details,
        "is_stared": this._isStared,
        "is_done": this._isDone ? 1 : 0,
      };
}
