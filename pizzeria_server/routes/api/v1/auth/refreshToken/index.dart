import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/auth/refreshToken/serivce.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  } else {
    return _refreshToken(context);
  }
}

Future<Response> _refreshToken(RequestContext context) async {
  final refreshTokenService = context.read<RefreshTokenService>();
  final refreshToken = RefreshTokenRequestModel.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );

  final refreshTokenResponse =
      await refreshTokenService.refreshToken(refreshToken);
  return refreshTokenResponse.fold(
    (error) => Response.json(
      statusCode: HttpStatus.internalServerError,
      body: error.toJson(),
    ),
    (success) => Response.json(
      body: success,
    ),
  );
}
