import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/core/database/database.dart';

final DatabaseClient _databaseClient = DatabaseClient.instance;

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  await _databaseClient.connect();
  return serve(handler.use(databaseProvider()).use(requestLogger()), ip, port);
}

Middleware databaseProvider() {
  return provider<DatabaseClient>((_) => _databaseClient);
}
