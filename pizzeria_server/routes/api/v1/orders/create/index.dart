import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/orders/service.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  } else {
    return _createOrder(context);
  }
}

Future<Response> _createOrder(RequestContext context) async {
  final ordersService = context.read<OrdersService>();
  final order = Order.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );

  final orderResponse = await ordersService.createOrder(order);
  // Return code 500 if an exception is caught.
  return orderResponse.fold(
    (error) => Response.json(
      statusCode: HttpStatus.internalServerError,
      body: error.toJson(),
    ),
    // Return code 200, user information, access and refresh tokens if everthing is fine.
    (success) => Response.json(
      body: 'OK',
    ),
  );
}
