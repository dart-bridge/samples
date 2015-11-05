library migrations;

import 'dart:async';
import 'package:bridge/database.dart';

class CreateTasksTable extends Migration {
  Future run(Gateway gateway) async {
    await gateway.model('tasks', (schema) {
      schema.string('description');
      schema.boolean('completed');
    });
  }

  Future rollback(Gateway gateway) async {
    await gateway.drop('tasks');
  }
}