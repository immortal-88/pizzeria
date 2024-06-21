// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/core/utils/jwt_utils.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

Middleware checkRefreshTokenExpirationMiddleware() {
  return (Handler innerHandler) {
    return (RequestContext context) async {
      try {
        final refreshTokenResponse = RefreshTokenRequestModel.fromJson(
          await context.request.json() as Map<String, dynamic>,
        );
        final jwt = JWTUtils.verifyRefreshToken(
          refreshToken: refreshTokenResponse.refreshToken,
        );
        // Check if the token has expired
        if (!jwt) {
          return Response.json(
            statusCode: HttpStatus.forbidden,
            body: 'Token has expired',
          );
        }
        return await innerHandler(context);
      } catch (e) {
        return Response.json(
          statusCode: HttpStatus.internalServerError,
          body: e.toString(),
        );
      }
    };
  };
}
