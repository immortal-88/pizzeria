import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/pizzas/repository.dart';
import 'package:pizzeria_server/api/v1/pizzas/service.dart';
import 'package:pizzeria_server/core/database/database.dart';

Handler middleware(Handler handler) {
  return handler.use(pizzasServiceProvider()).use(pizzasRepositoryProvider());
}

Middleware pizzasRepositoryProvider() {
  return provider<PizzasRepository>(
    (context) => PizzasRepository(
      databaseClient: context.read<DatabaseClient>(),
    ),
  );
}

Middleware pizzasServiceProvider() {
  return provider<PizzasService>(
    (context) => PizzasService(
      pizzasRepository: context.read<PizzasRepository>(),
    ),
  );
}
