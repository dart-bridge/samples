library main;

import 'dart:async';

import 'package:bridge/bridge.dart';
import '../app.dart';

/// Controllers
part 'tasks_controller.dart';

/// This is the entry point to the transport layer of the application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Main {
  final TasksController tasksController;

  Main(this.tasksController);

  routes(Router router) {
    router.get('/', () => redirect(route('tasks.index')));
    router.resource('tasks', tasksController);
  }
}
