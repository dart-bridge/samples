library main;

import 'dart:async';

import 'package:bridge/bridge.dart';
import '../app.dart';
import 'package:todo_service/todo_service.dart';

/// Controllers
part 'tasks_controller.dart';

class Main {
  final TasksController controller;

  Main(this.controller);

  routes(Router router) {
    router.get('/', () => public('index.html'));
  }

  tether(Tether tether) {
    tether.listen('tasks.all', controller.index);
    tether.listen('tasks.new', controller.create);
    tether.listen('tasks.save', controller.save);
    tether.listen('tasks.delete', controller.delete);
  }
}
