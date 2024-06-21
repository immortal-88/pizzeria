// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:pizzeria_server/api/v1/auth/refreshToken/repository.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class RefreshTokenService {
  RefreshTokenService({required RefreshTokenRepository refreshTokenRepository})
      : _refreshTokenRepository = refreshTokenRepository;

  final RefreshTokenRepository _refreshTokenRepository;

  Future<Either<FailureModel, RefreshTokenResponseModel>> refreshToken(
    RefreshTokenRequestModel request,
  ) async {
    try {
      final tokenResponse = await _refreshTokenRepository.refreshToken(request);
      return right(tokenResponse);
    } on InvalidCredentialsException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (_) {
      return left(const FailureModel(message: UnknownException.message));
    }
  }
}
