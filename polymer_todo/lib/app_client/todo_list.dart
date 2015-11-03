@HtmlImport('todo_list.html')
library todo_polymer.todo_list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'dart:html';
import 'todo_item.dart';
import 'package:todo_service/shared.dart';
import 'package:bridge/tether_client.dart';

/// This element contains the logic for adding and removing tasks, syncing with
/// the server by listening to Tether events.
@PolymerRegister('todo-list')
class TodoList extends PolymerElement {

  /// This is the observable list of [Task]s that the list iterates over.
  @property final List<Task> tasks = [];

  TodoList.created() : super.created() {
    // As soon as the element is created, we fetch the task list from the
    // server and populate the observable list with it.
    tether.send('tasks.all').then(addAllTasks);

    // Next, we attach listeners that will receive updates from the server when
    // tasks are added, changed, or removed.
    tether.listen('tasks.publish', addTask);
    tether.listen('tasks.update', updateTask);
    tether.listen('tasks.delete', removeTask);
  }

  updateTask(Task task) {
    // Instead of publishing the changes to the task object that's "live" in
    // the DOM, we replace it with the new task instance, forcing the DOM to
    // rerender and scrap the old state.
    final assigned = tasks.firstWhere((t) => t == task);
    final index = tasks.indexOf(assigned);
    replaceRange('tasks', index, index + 1, [task]);
  }

  /// This property is bound to the input box for adding a new task
  @property
  String newTaskDescription = '';

  /// Gets fired when the used presses 'enter' in the text box, or if a
  /// submit button was added, that would work too.
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
