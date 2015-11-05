part of todo_service;

class TodoList {
  final Repository<Task> _tasks;

  TodoList(this._tasks);

  Future<Task> create(String description) async {
    final task = new Task()
      ..description = description;

    await _tasks.save(task);

    return task;
  }

  Future save(Task task) => _tasks.save(task);

  Future delete(Task task) => _tasks.delete(task);

  Stream<Task> all() => _tasks.all();
}
