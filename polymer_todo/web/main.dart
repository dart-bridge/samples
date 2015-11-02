import 'package:bridge/bridge_client.dart';
import 'package:polymer_todo/client.dart';
import 'package:polymer/init.dart' as polymer;

main() async {
  // Register shared data structures
  registerTransport();
  
  // Connect the tether
  await globalTether();

  return polymer.main();
}