import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/profile/repository.dart';
import 'package:pizzeria_server/api/v1/profile/service.dart';
import 'package:pizzeria_server/core/common_middleware/token_expiration.dart';
import 'package:pizzeria_server/core/database/database.dart';

Handler middleware(Handler handler) {
  return handler
      .use(profileServiceProvider())
      .use(profileRepositoryProvider())
      .use(checkTokenExpirationMiddleware());
}

Middleware profileRepositoryProvider() {
  return provider<ProfileRepository>(
    (context) => ProfileRepository(
      databaseClient: context.read<DatabaseClient>(),
    ),
  );
}

Middleware profileServiceProvider() {
  return provider<ProfileService>(
    (context) => ProfileService(
      profileRepository: context.read<ProfileRepository>(),
    ),
  );
}
