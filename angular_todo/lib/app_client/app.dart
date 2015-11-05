part of app;

/// This component is not used for any practical reason, other than
/// providing structure. Also, the stylesheet latches on to the tag name,
/// so we'll keep this as a point of extension
@Component(
    selector: 'todo-app',
    directives: const [TodoList],
    template: r'''
<h1>Tasks</h1>
<todo-list></todo-list>
''')
class App {}
