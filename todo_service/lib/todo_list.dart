part of todo_service;

class TodoList {
  final Repository<Task> _tasks;

  TodoList(this._tasks);

  Future<Task> create(String description) async {
    final task = new Task()
      ..description = description;

    await _tasks.add(task);

    return task;
  }

  Future save(Task task) => _tasks.update(task);

  Future delete(Task task) => _tasks.delete(task);

  Stream<Task> all() => _tasks.all();
}
