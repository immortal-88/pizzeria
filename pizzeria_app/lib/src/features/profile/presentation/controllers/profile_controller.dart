import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  FutureOr<UserLoginModel> build() {
    return getProfile();
  }

  Future<UserLoginModel> getProfile() async {
    state = const AsyncValue.loading();
    try {
      final userProfile =
          await ref.read(repositoryProvider).profileApi.getProfile();
      state = AsyncValue.data(userProfile);
      return userProfile;
    } on DioException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      throw Exception('Error');
    }
  }
}
