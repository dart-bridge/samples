part of services;

/// This service provider adds you custom commands to the CLI. If this
/// gets too crowded, consider breaking it up into multiple service providers.
/// Just remember to add each provider to [config:app.service_providers]
class CommandsServiceProvider extends ServiceProvider {
  Program cli;

  Future load(Program cli) async {
    this.cli = cli;
  }
}
