part of app;

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
  final List<Task> tasks = [];
  String newTaskDescription = '';

  TodoList() {
    tether.send('tasks.all').then(tasks.addAll);
    tether.listen('tasks.publish', tasks.add);
    tether.listen('tasks.delete', tasks.remove);
    tether.listen('tasks.update', updateTask);
  }

  onSubmit(Event event) {
    event.preventDefault();
    if (newTaskDescription == '') return;

    tether.send('tasks.new', newTaskDescription);
    newTaskDescription = '';
  }

  toggleCompletion(Task task) {
    task.completed = !task.completed;
    tether.send('tasks.save', task);
  }

  updateTask(Task task) {
    final assigned = tasks.firstWhere((t) => t == task);
    final index = tasks.indexOf(assigned);
    tasks.replaceRange(index, index + 1, [task]);
  }

  removeTask(Task task, Event event) {
    event.stopPropagation();
    tether.send('tasks.delete', task);
  }

  Map<String, bool> checkboxClass(Task task) {
    return {
      'complete': true,
      'checked': task.completed,
    };
  }
}
