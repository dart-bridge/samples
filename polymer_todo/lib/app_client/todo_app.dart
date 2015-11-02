@HtmlImport('todo_app.html')
library todo_polymer.todo_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('todo-app')
class TodoApp extends PolymerElement {
  @property
  List<String> items = ['item1', 'item2'];

  TodoApp.created(): super.created();
}
