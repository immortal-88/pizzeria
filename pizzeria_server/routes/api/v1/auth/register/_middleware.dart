import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/auth/register/repository.dart';
import 'package:pizzeria_server/api/v1/auth/register/service.dart';
import 'package:pizzeria_server/core/database/database.dart';

Handler middleware(Handler handler) {
  return handler
      .use(registerServiceProvider())
      .use(registerRepositoryProvider());
}

Middleware registerRepositoryProvider() {
  return provider<RegisterRepository>(
    (context) => RegisterRepository(
      databaseClient: context.read<DatabaseClient>(),
    ),
  );
}

Middleware registerServiceProvider() {
  return provider<RegisterService>(
    (context) => RegisterService(
      registerRepository: context.read<RegisterRepository>(),
    ),
  );
}
