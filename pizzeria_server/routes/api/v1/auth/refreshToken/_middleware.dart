import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/auth/refreshToken/repository.dart';
import 'package:pizzeria_server/api/v1/auth/refreshToken/serivce.dart';
import 'package:pizzeria_server/core/common_middleware/refresh_expiration.dart';
import 'package:pizzeria_server/core/database/database.dart';

Handler middleware(Handler handler) {
  return handler
      .use(refreshTokenServiceProvider())
      .use(refreshTokenRepositoryProvider())
      .use(checkRefreshTokenExpirationMiddleware());
}

Middleware refreshTokenRepositoryProvider() {
  return provider<RefreshTokenRepository>(
    (context) => RefreshTokenRepository(
      databaseClient: context.read<DatabaseClient>(),
    ),
  );
}

Middleware refreshTokenServiceProvider() {
  return provider<RefreshTokenService>(
    (context) => RefreshTokenService(
      refreshTokenRepository: context.read<RefreshTokenRepository>(),
    ),
  );
}
