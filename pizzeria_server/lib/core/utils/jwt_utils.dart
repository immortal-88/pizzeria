// ignore_for_file: public_member_api_docs

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:pizzeria_server/core/constants/jwt_constants.dart';

abstract class JWTUtils {
  static String generateAccessToken({required String userId}) {
    final jwt = JWT({'id': userId});
    print('jwt: $jwt');
    return jwt.sign(
      SecretKey(JWTConstants.accesssTokenSecretKey),
      expiresIn: const Duration(minutes: 10),
    );
  }

  static bool verifyAccessToken({required String accessToken}) {
    try {
      JWT.verify(accessToken, SecretKey(JWTConstants.accesssTokenSecretKey));
      return true;
    } catch (_) {
      return false;
    }
  }

  static String getUserIdFromToken({required String accessToken}) {
    final jwt = JWT.decode(accessToken);
    // ignore: avoid_dynamic_calls
    return jwt.payload['id'] as String;
  }

  static String generateRefreshToken({required String userId}) {
    final jwt = JWT({'id': userId});
    return jwt.sign(
      SecretKey(JWTConstants.refreshTokenSecretKey),
      expiresIn: const Duration(days: 2),
    );
  }

  static bool verifyRefreshToken({required String refreshToken}) {
    try {
      JWT.verify(refreshToken, SecretKey(JWTConstants.refreshTokenSecretKey));
      return true;
    } catch (_) {
      return false;
    }
  }
}
