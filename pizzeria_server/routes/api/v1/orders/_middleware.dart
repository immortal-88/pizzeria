import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/orders/repository.dart';
import 'package:pizzeria_server/api/v1/orders/service.dart';
import 'package:pizzeria_server/core/database/database.dart';

Handler middleware(Handler handler) {
  return handler.use(ordersServiceProvider()).use(ordersRepositoryProvider());
}

Middleware ordersRepositoryProvider() {
  return provider<OrdersRepository>(
    (context) => OrdersRepository(
      databaseClient: context.read<DatabaseClient>(),
    ),
  );
}

Middleware ordersServiceProvider() {
  return provider<OrdersService>(
    (context) => OrdersService(
      ordersRepository: context.read<OrdersRepository>(),
    ),
  );
}
