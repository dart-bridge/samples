library todo_service.shared;

import 'package:bridge/database_shared.dart';
import 'package:bridge/transport_shared.dart';

part 'task.dart';

void registerTodoTransport() {
  serializer.register('todo_service.Task', Task,
      serialize: (Task task) => {
        'id': task.id,
        'created_at': task.createdAt,
        'updated_at': task.updatedAt,
        'completed': task.completed,
        'description': task.description,
      },
      deserialize: (Map task) => new Task()
        ..id = task['id']
        ..createdAt = task['created_at']
        ..updatedAt = task['updated_at']
        ..completed = task['completed']
        ..description = task['description']
      );
}
