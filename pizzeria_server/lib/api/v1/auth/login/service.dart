// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:pizzeria_server/api/v1/auth/login/repository.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class LoginService {
  LoginService({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  Future<Either<FailureModel, LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    try {
      final user = await _loginRepository.login(request);
      return right(user);
    } on InvalidCredentialsException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (_) {
      return left(const FailureModel(message: UnknownException.message));
    }
  }
}
