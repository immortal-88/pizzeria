import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/pizzas/service.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  } else {
    return _pizzas(context);
  }
}

Future<Response> _pizzas(RequestContext context) async {
  final pizzaService = context.read<PizzasService>();

  final pizzasResponse = await pizzaService.getAllPizzas();
  return pizzasResponse.fold(
    (error) => Response.json(
      statusCode: HttpStatus.internalServerError,
      body: error.toJson(),
    ),
    (success) => Response.json(
      body: success,
    ),
  );
}
