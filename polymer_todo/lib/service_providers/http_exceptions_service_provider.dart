part of services;

/// This service provider is dedicated to creating pretty feedback to the client
/// when exceptions are thrown in the HTTP layer.
class HttpExceptionsServiceProvider extends ServiceProvider {
  load(Server server) async {
    // This is the global exception handler. It must be registered first.
    server.handleException(Object, globalHandler);

    // Subsequent handlers should go from unspecific to specific exceptions.
    // In other words: base classes first, sub classes last.
    server.handleException(HttpNotFoundException, notFoundHandler);
  }

  Future<shelf.Response> notFoundHandler(Exception exception, StackTrace stack) {
    return errorTemplate(404);
  }

  Future<shelf.Response> globalHandler(Object exception, StackTrace stack) {
    return errorTemplate(500);
  }

  Future<shelf.Response> errorTemplate(int code) async {
    final shelf.Response response = await public('index.html');

    return new shelf.Response(code,
        body: response.read(),
        headers: response.headers,
        encoding: response.encoding,
        context: response.context);
  }
}
