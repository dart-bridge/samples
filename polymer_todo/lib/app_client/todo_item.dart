@HtmlImport('todo_item.html')
library todo_polymer.todo_item;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:todo_service/shared.dart';
import 'dart:html';
import 'package:bridge/tether_client.dart';

@PolymerRegister('todo-item')
class TodoItem extends PolymerElement {
  TodoItem.created() : super.created();

  @Property(observer: 'onTask')
  Task task;

  @property
  String description = '';

  @property
  bool isChecked = false;

  @reflectable
  onTask(Task task, [_]) {
    set('description', task.description);
    set('isChecked', task.completed);
  }

  @Listen('tap')
  onTap(_, __) {
    task.completed = !task.completed;
    onTask(task);
    tether.send('tasks.save', task);
  }

  @reflectable
  removeTask(Event event, __) {
    event.stopPropagation();
    tether.send('tasks.delete', task);
  }

  @reflectable
  String completeClass(bool isChecked) {
    return 'complete${isChecked ? ' checked' : ''}';
  }
}
