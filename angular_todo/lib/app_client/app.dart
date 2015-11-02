part of app;

@Component(
    directives: const [NgFor, NgModel, FORM_DIRECTIVES],
    selector: 'todo-app',
    template: r'''
<h1>
  Todos
</h1>
<form (submit)='onSubmit()'>
  <input [ng-model]="taskTitle" (ng-model-change)="taskTitle=$event"></input>
  <input [ng-model]="taskDescription" (ng-model-change)="taskDescription=$event"></input>
  <input type='submit' value='Add'>
</form>
<ul>
  <li *ng-for='#task of tasks'>
    {{task.title}}
  </li>
</ul>
''')
class App {
  final List<Task> tasks = [];
  String taskTitle;
  String taskDescription;

  App() {
    tether.send('todos.all').then(addTasks);
    tether.listen('todos.publish', addTask);
  }

  void onSubmit() {
    tether.send('todo.new', [taskTitle, taskDescription]);
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void addTasks(List<Task> tasks) {
    this.tasks.addAll(tasks);
  }
}
