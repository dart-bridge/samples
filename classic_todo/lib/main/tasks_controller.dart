part of main;

class TasksController {
  final Repository<Task> _tasks;

  TasksController(this._tasks);

  index() {
    return template('tasks.index')
      ..tasks = _tasks.all();
  }

  store(Input input) async {
    final task = new Task()
      ..description = input['description'];

    await _tasks.save(task);

    return redirect(route('tasks.index'));
  }

  update(Input input, {String id}) async {
    final task = await _tasks.find(int.parse(id))
      ..description = input['description']
      ..completed = input.has('completed');

    await _tasks.save(task);

    return redirect(route('tasks.index'));
  }

  destroy({String id}) async {
    final task = await _tasks.find(int.parse(id));

    await _tasks.delete(task);

    return redirect(route('tasks.index'));
  }
}
