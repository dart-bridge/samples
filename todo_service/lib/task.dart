part of todo_service.shared;

class Task extends Model {
  @field bool completed = false;
  @field String title;
  @field String description;

  operator ==(Task other) =>
      other is Task && other.id == id;
}
