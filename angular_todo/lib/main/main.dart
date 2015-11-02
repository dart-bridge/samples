library main;

import 'dart:async';

import 'package:bridge/bridge.dart';
import '../app.dart';
import 'package:todo_service/todo_service.dart';

/// Controllers
part 'todo_controller.dart';

class Main {
  final TodoController controller;

  Main(this.controller);

  routes(Router router) {
    router.get('/', () => public('index.html'));
  }

  tether(Tether tether) {
    tether.listen('todo.all', controller.index);
    tether.listen('todo.new', controller.create);
  }
}
