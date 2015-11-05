part of app;

/// This component contains the logic for the to-do list, and talks directly
/// to the server using the Tether.
@Component(
    selector: 'todo-list',
    directives: const [NgFor, FORM_DIRECTIVES, NgClass],
    template: r'''
<ul>
  <li *ng-for='#task of tasks' (click)="toggleCompletion(task)">
    <span [ng-class]="checkboxClass(task)"></span>
    <span class="description">{{task.description}}</span>
    <span class="delete" (click)='removeTask(task, $event)'></span>
  </li>
  <li>
    <form (submit)='onSubmit($event)'>
      <input
        name='title'
        type="text"
        placeholder='New task...'
        [(ng-model)]="newTaskDescription">
    </form>
  </li>
</ul>
''')
class TodoList {
  // The mutable list of tasks, that is represented directly
  // in the view.
  final List<Task> tasks = [];
  // This is bound to the input field
  String newTaskDescription = '';

  TodoList() {
    // When the component mounts, we fetch all tasks from the
    // server and adds them to our list.
    tether.send('tasks.all').then(tasks.addAll);

    // Then we start listening for updates broadcasted from the server
    // for changes in the task list.
    tether.listen('tasks.publish', tasks.add);
    tether.listen('tasks.delete', tasks.remove);
    tether.listen('tasks.update', updateTask);
  }

  // When the new-task-form is submitted.
  onSubmit(Event event) {
    event.preventDefault();
    if (newTaskDescription == '') return;

    // Send the new task title through to the server. See lib/main/main.dart.
    tether.send('tasks.new', newTaskDescription);

    // Clear out the input.
    newTaskDescription = '';
  }

  // When the task is clicked
  toggleCompletion(Task task) {
    // Toggle the completed state of the task.
    task.completed = !task.completed;

    // Send the task to the server for saving the new state.
    tether.send('tasks.save', task);
  }

  // When the server reports a change to a task.
  updateTask(Task task) {
    // To account for every change that the task sent from the server
    // has, we need to replace the current version of the task in the
    // view model.

    // We can find the old version of the task very easily, thanks to
    // the overrided [Task#==] operator.
    final assigned = tasks.firstWhere((t) => t == task);

    // Next, we get the location of the old task in the list.
    final index = tasks.indexOf(assigned);

    // Then we replace the old version with the new task
    tasks.replaceRange(index, index + 1, [task]);
  }

  // When the 'x' is clicked
  removeTask(Task task, Event event) {
    event.stopPropagation();

    // Simply send through the delete command with the task.
    tether.send('tasks.delete', task);
  }

  // Computing the classes of the checkbox span. The CSS requires
  // .complete for the idle state and .complete.checked for the
  // checked state.
  Map<String, bool> checkboxClass(Task task) {
    return {
      'complete': true,
      'checked': task.completed,
    };
  }
}
