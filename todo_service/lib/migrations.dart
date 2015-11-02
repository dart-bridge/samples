part of todo_service;

class CreateTasksTable extends Migration {
  Future run(Gateway gateway) async {
    await gateway.create('tasks', (schema) {
      schema
        ..id()
        ..timestamps()
        ..boolean('completed').nullable(false)
        ..string('title').nullable(false)
        ..string('description').nullable(true);
    });
  }

  Future rollback(Gateway gateway) async {
    await gateway.drop('tasks');
  }
}
