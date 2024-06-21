// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:pizzeria_server/api/v1/profile/repository.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class ProfileService {
  ProfileService({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;

  final ProfileRepository _profileRepository;

  Future<Either<FailureModel, UserLoginModel>> getProfile(
    String id,
  ) async {
    try {
      final user = await _profileRepository.getProfile(id);
      return right(user);
    } on InvalidCredentialsException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (_) {
      return left(const FailureModel(message: UnknownException.message));
    }
  }
}
