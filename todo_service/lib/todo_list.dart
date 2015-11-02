part of todo_service;

class TodoList {
  final Repository<Task> _tasks;

  TodoList(this._tasks);

  Future<Task> create(String title, [String description]) async {
    final task = new Task()
      ..title = title
      ..description = description;

    await _tasks.add(task);

    return task;
  }

  Future save(Task task) => _tasks.update(task);

  Stream<Task> all() => _tasks.all();
}
