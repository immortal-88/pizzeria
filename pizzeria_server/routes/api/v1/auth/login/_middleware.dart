import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/auth/login/repository.dart';
import 'package:pizzeria_server/api/v1/auth/login/service.dart';
import 'package:pizzeria_server/core/database/database.dart';

Handler middleware(Handler handler) {
  return handler.use(loginServiceProvider()).use(loginRepositoryProvider());
}

Middleware loginRepositoryProvider() {
  return provider<LoginRepository>(
    (context) => LoginRepository(
      databaseClient: context.read<DatabaseClient>(),
    ),
  );
}

Middleware loginServiceProvider() {
  return provider<LoginService>(
    (context) => LoginService(
      loginRepository: context.read<LoginRepository>(),
    ),
  );
}
