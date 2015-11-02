part of app.shared;

/// Registers data structures that will be transferred through the [Tether].
void registerTransport() {
  registerViewTransport(); // bridge.view
  registerExceptionsTransport(); // bridge.exceptions
  registerTetherTransport(); // bridge.tether
  registerValidationTransport(); // bridge.validation
  registerTodoTransport(); // todo_service
}