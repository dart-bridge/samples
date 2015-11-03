@HtmlImport('todo_list.html')
library todo_polymer.todo_list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'dart:html';
import 'todo_item.dart';
import 'package:todo_service/shared.dart';
import 'package:bridge/tether_client.dart';

@PolymerRegister('todo-list')
class TodoList extends PolymerElement {
  @property final List<Task> tasks = [];

  TodoList.created() : super.created() {
    tether.send('tasks.all').then(addAllTasks);
    tether.listen('tasks.publish', addTask);
    tether.listen('tasks.delete', removeTask);
    tether.listen('tasks.update', updateTask);
  }

  updateTask(Task task) {
    final assigned = tasks.firstWhere((t) => t == task);
    final index = tasks.indexOf(assigned);
    replaceRange('tasks', index, index + 1, [task]);
  }

  @property
  String newTaskDescription = '';

  @reflectable
  void newTaskSubmit(Event event, _) {
    event.preventDefault();
    if (newTaskDescription == '') return;

    tether.send('tasks.new', newTaskDescription);
    set('newTaskDescription', '');
  }

  void addTask(Task task) => add('tasks', task);
  void removeTask(Task task) => removeItem('tasks', task);

  void addAllTasks(Iterable<Task> tasks) => addAll('tasks', tasks);
}
