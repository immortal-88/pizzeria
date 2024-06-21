import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/auth/register/service.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  } else {
    return _register(context);
  }
}

Future<Response> _register(RequestContext context) async {
  final registerService = context.read<RegisterService>();
  final userModel = RegisterRequestModel.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );

  final registerResponse = await registerService.register(userModel);
  // Return code 500 if an exception is caught.
  return registerResponse.fold(
    (error) => Response.json(
      statusCode: HttpStatus.internalServerError,
      body: error.toJson(),
    ),
    // Return code 201 if everything is fine.
    (success) => Response.json(
      statusCode: HttpStatus.created,
    ),
  );
}
