import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:pizzeria_server/api/v1/profile/service.dart';
import 'package:pizzeria_server/core/utils/jwt_utils.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  } else {
    return _getProfile(context);
  }
}

Future<Response> _getProfile(RequestContext context) async {
  final profileService = context.read<ProfileService>();
  final token = context.request.headers[HttpHeaders.authorizationHeader];
  final id = JWTUtils.getUserIdFromToken(accessToken: token!);

  final profileResponse = await profileService.getProfile(id);
  return profileResponse.fold(
    (error) => Response.json(
      statusCode: HttpStatus.internalServerError,
      body: error.toJson(),
    ),
    (success) => Response.json(
      body: success,
    ),
  );
}
