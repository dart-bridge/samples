part of main;

class TasksController {
  final TodoList _todos;
  final TetherManager _tethers;

  TasksController(this._todos, this._tethers);

  Future<List<Task>> index() {
    return _todos.all().toList();
  }

  Future<Task> create(String description) async {
    final task = await _todos.create(description);
    _tethers.broadcast('tasks.publish', task);
    return task;
  }

  Future save(Task task) async {
    await _todos.save(task);
    _tethers.broadcast('tasks.update', task);
  }

  Future delete(Task task) async {
    await _todos.delete(task);
    _tethers.broadcast('tasks.delete', task);
  }
}
