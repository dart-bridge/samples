@HtmlImport('todo_app.html')
library todo_polymer.todo_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'todo_list.dart';

/// This element is basically just a wrapper, and could be removed. However it
/// provides some structure and could be used to extend the app in the future.
///
/// Besides, the stylesheet latches on to this element, and we aren't using
/// scoped CSS, so for the time being, this is necessary.
@PolymerRegister('todo-app')
class TodoApp extends PolymerElement {
  TodoApp.created(): super.created();
}
