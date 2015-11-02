@HtmlImport('todo_item.html')
library todo_polymer.todo_item;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'dart:html';

@PolymerRegister('todo-item')
class TodoItem extends PolymerElement {
  @property String title;
  @property String description;

  TodoItem.created(): super.created();

  factory TodoItem() => new Element.tag('todo-item');
}
