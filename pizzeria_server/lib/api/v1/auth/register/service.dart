// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:pizzeria_server/api/v1/auth/register/repository.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class RegisterService {
  RegisterService({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;

  final RegisterRepository _registerRepository;

  Future<Either<FailureModel, void>> register(
    RegisterRequestModel request,
  ) async {
    try {
      await _registerRepository.register(request);
      return right(null);
    } on UserExistsException catch (e) {
      return left(FailureModel(message: e.message));
    } on DataInsertException catch (e) {
      return left(FailureModel(message: e.message));
    } on DatabaseConnectionException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (e) {
      return left(const FailureModel(message: UnknownException.message));
    }
  }
}
