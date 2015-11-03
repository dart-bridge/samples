@HtmlImport('todo_item.html')
library todo_polymer.todo_item;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:todo_service/shared.dart';
import 'dart:html';
import 'package:bridge/tether_client.dart';

/// This element represents a [Task] object in the DOM. Since the [Task] class
/// is shared with the server, we cannot make it mix in [JsProxy]. That means
/// we can't observe the [task] object's properties.
///
///     <!-- doesn't work! -->
///     <span>{{task.description}}</span>
///
/// Instead, we need the element itself to provide the observable properties
/// that Polymer requires. And when the [task] property is assigned to, we
/// update the observable properties to reflect the new changes.
@PolymerRegister('todo-item')
class TodoItem extends PolymerElement {
  TodoItem.created() : super.created();

  /// The task to represent in the DOM. Notice the [observer] argument in the
  /// [Property] annotation.
  @Property(observer: 'onTask')
  Task task;

  /// The observable property representing [Task#description].
  @property
  String description = '';

  /// The observable property representing [Task#completed].
  @property
  bool completed = false;

  /// When the [task] is assigned, this maps the necessary properties over to
  /// the observable, element level, ones.
  @reflectable
  onTask(Task task, [_]) {
    set('description', task.description);
    set('completed', task.completed);
  }

  @Listen('tap')
  onTap(_, __) {
    // When the element is tapped, we toggle the completed state on the task
    task.completed = !task.completed;

    // And then we update the view
    onTask(task);

    // Finally we send the [Task] off to the server.
    tether.send('tasks.save', task);
  }

  @reflectable
  removeTask(Event event, __) {
    event.stopPropagation();

    // When the 'x' is tapped, we just send a message to the server, telling
    // it to remove this task from the to-do list.
    tether.send('tasks.delete', task);
  }

  /// Computes the class of the checkbox-element (span.complete), adding
  /// a 'checked' class if the [Task] indeed is completed.
  @reflectable
  String completeClass(bool isChecked) {
    return 'complete ${isChecked ? 'checked' : ''}';
  }
}
