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
    // To follow Angular conventions, we put the templates in
    // the web/ directory. To respond with the correct file, we
    // use the [public] helper, which will return the corresponding
    // file in storage/.build/web/ if we're in production mode.
    router.get('/', () => public('index.html'));
  }

  tether(Tether tether) {
    // Sent by [lib/app_client/todo_list.dart]
    tether.listen('tasks.all', controller.index);
    tether.listen('tasks.new', controller.create);
    tether.listen('tasks.save', controller.save);
    tether.listen('tasks.delete', controller.delete);
  }
}
