# Todo Service

This folder contains a service for the Todo logic. It's a separate library that's imported
into other Todo apps in this repo.

This is to demonstrate the extensible nature of Bridge, and how easy it is to plug in
external Service Providers and Migrations.

```dart
// lib/services.dart
import 'package:todo_service/todo_service.dart';
```

```yaml
# config/app.yaml
service_providers:
- todo_service.TodoServiceProvider
```

```yaml
# config/database.yaml
migrations:
- todo_service.CreateTasksTable
```

