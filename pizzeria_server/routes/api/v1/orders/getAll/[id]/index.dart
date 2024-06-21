import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/orders/service.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  } else {
    return _orders(context, id);
  }
}

Future<Response> _orders(RequestContext context, String id) async {
  final ordersService = context.read<OrdersService>();

  final ordersResponse = await ordersService.getOrders(id);
  return ordersResponse.fold(
    (error) => Response.json(
      statusCode: HttpStatus.internalServerError,
      body: error.toJson(),
    ),
    (success) => Response.json(
      body: success,
    ),
  );
}
