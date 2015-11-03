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
    // To follow Polymer conventions, we store 'index.html' in the 'web'
    // directory. This [public] helper method returns a response object created
    // from the correct file. (If we're in production it will use the
    // transformed file from 'storage/.build/web')
    router.get('/', () => public('index.html'));
  }

  tether(Tether tether) {
    // Sent from 'lib/app_client/todo_list.dart'
    tether.listen('tasks.all', controller.index);
    tether.listen('tasks.new', controller.create);

    // Sent from 'lib/app_client/todo_item.dart'
    tether.listen('tasks.save', controller.save);
    tether.listen('tasks.delete', controller.delete);
  }
}
