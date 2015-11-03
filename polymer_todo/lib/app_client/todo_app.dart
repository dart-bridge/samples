@HtmlImport('todo_app.html')
library todo_polymer.todo_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'todo_list.dart';

@PolymerRegister('todo-app')
class TodoApp extends PolymerElement {
  TodoApp.created(): super.created();
}
