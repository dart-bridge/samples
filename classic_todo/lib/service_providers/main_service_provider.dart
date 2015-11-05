part of services;

/// This is a service provider. It will be instantiated when the program is
/// started using `dart bridge`. Read more about the [ServiceProvider]
/// to learn how to implement your own.
@DependsOn(HttpServiceProvider)
class MainServiceProvider extends ServiceProvider {
  load(Container container, Main main) async {
    // Register routes
    await container.resolve(main.routes);
  }
}
