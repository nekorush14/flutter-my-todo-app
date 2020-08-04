class Todo {
  int id;
  String title;
  String detail;
  bool isStared;
  bool isDone;

  Todo(
      {this.id,
      this.title,
      this.detail,
      this.isStared = false,
      this.isDone = false});

  factory Todo.fromDB(Map<String, dynamic> data) => Todo(
        id: data['id'],
        title: data['title'],
        detail: data['detail'],
        isStared: data['isStared'],
        isDone: data['is_done'] == 1 ? true : false,
      );

  Map<String, dynamic> toDBFormat() => {
        "id": this.id,
        "title": this.title,
        "details": this.detail,
        "is_stared": this.isStared,
        "is_done": this.isDone ? 1 : 0,
      };
}
