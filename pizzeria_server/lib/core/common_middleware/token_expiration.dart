// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/core/utils/jwt_utils.dart';

Middleware checkTokenExpirationMiddleware() {
  return (Handler innerHandler) {
    return (RequestContext context) async {
      try {
        // Extract the JWT token from the request headers
        final authHeader = context.request.headers['Authorization'];
        final token = authHeader?.replaceFirst('Bearer ', '');
        if (token == null) {
          return Response.json(statusCode: HttpStatus.unauthorized);
        }
        // Verify the JWT token
        final jwt = JWTUtils.verifyAccessToken(accessToken: token);
        // Check if the token has expired
        if (!jwt) {
          return Response.json(
            statusCode: HttpStatus.unauthorized,
            body: 'Token has expired',
          );
        }
        // Token is valid and has not expired, pass the request to the inner handler
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
