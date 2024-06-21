import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@Riverpod()
class RegisterController extends AutoDisposeAsyncNotifier<void> {
  Future<void> register(
      {required String email,
      required String password,
      required String name,
      required String lastName}) async {
    state = const AsyncValue.loading();
    try {
      final register = await ref.read(repositoryProvider).authApi.register(
          RegisterRequestModel(
              email: email,
              password: password,
              firstName: name,
              lastName: lastName));
      state = AsyncValue.data(register);
    } on DioException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      throw Exception('Error');
    }
  }

  @override
  FutureOr<void> build() {
    return null;
  }
}
