part of app;

@Component(
    selector: 'todo-app',
    directives: const [TodoList],
    template: r'''
<h1>Tasks</h1>
<todo-list></todo-list>
''')
class App {}
