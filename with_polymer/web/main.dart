import 'package:bridge/bridge_client.dart';
import 'package:app/client.dart';

/// This the example boilerplate of a client script file. Inject this
/// script into a template by using the following syntax in a controller.
///
///     return template('templateName').withScript('main');
///
/// A good practice would be to delegate the client script into your client
/// application in **lib/client** as neatly as possible.
main() async {
  // Register shared data structures
  registerTransport();
  
  // Connect the tether
  await globalTether();

  // Example where we use the Tether to get all users from the server
  List<User> users = await tether.send('users');
  print(users);
}