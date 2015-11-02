part of main;

class TodoController {
  final TodoList _todos;
  final TetherManager _tethers;

  TodoController(this._todos, this._tethers);

  Future<List<Task>> index() {
    return _todos.all().toList();
  }

  Future<Task> create(taskData) async {
    final task = _todos.create(taskData[0], taskData[1]);
    _tethers.broadcast('todos.publish', task);
    return task;
  }
}
