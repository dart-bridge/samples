library main;

import 'dart:async';

import 'package:todo_service/todo_service.dart';
import 'package:bridge/bridge.dart';
import '../app.dart';

/// Controllers
part 'todo_controller.dart';

class Main {
  final TodoController controller;

  Main(this.controller);

  routes(Router router) {
    router.get('/', () => public('index.html'));
  }

  tether(Tether tether) {
    tether.listen('todos.all', controller.index);
  }
}
