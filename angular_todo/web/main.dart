import 'package:bridge/bridge_client.dart';
import 'package:angular_todo/client.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';

main() async {
  // Register shared data structures
  registerTransport();

  // Connect the tether
  await globalTether();

  // Start Angular application and provide an instance of the global Tether
  return bootstrap(App, [provide(Tether, useValue: tether)]);
}
