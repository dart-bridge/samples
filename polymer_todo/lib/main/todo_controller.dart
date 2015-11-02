part of main;

class TodoController {
  final TodoList _todos;
  final TetherManager _tethers;

  TodoController(this._todos, this._tethers);

  Future<List<Task>> index() {
    return _todos.all().toList();
  }
}
