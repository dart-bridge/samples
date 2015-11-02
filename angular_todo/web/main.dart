import 'package:bridge/bridge_client.dart';
import 'package:angular_todo/client.dart';
import 'package:angular2/bootstrap.dart';

main() async {
  // Register shared data structures
  registerTransport();
  
  // Connect the tether
  await globalTether();

  return bootstrap(App);
}
