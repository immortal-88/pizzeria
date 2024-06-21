import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/database/hive_provider.dart';
import 'package:pizzeria_app/src/database/storage_keys.dart';
import 'package:pizzeria_app/src/features/auth/data/token_info_response.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_app/src/routing/router.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@Riverpod()
class LoginController extends _$LoginController {
  @override
  FutureOr<LoginResponseModel> build() {
    return const LoginResponseModel(
        accessToken: '', refreshToken: '', id: '', user: UserShort(id: ''));
  }

  Future<LoginResponseModel> login(
      {required String email, required String password}) async {
    final storage = await ref.watch(hiveProvider.future);
    final appState = ref.read(appStateProvider.notifier);

    state = const AsyncValue.loading();
    try {
      final auth = await ref
          .read(repositoryProvider)
          .authApi
          .login(LoginRequestModel(email: email, password: password));
      // state = AsyncValue.data(auth);
      final tokenInfo = TokenInfoResponse(
          userId: auth.id,
          firstName: auth.user.firstName,
          lastName: auth.user.lastName,
          photoUrl: auth.user.photoUrl);
      if (auth.accessToken.isNotEmpty) {
        appState.state = AppState.authorized(tokenInfo);
        print('TOKEN INFO: $tokenInfo');

        // ref.read(appStateProvider.notifier).state =
        //     AppState.authorized(tokenInfo);

        // final tokenInfo = TokenInfoResponse(userId: auth.id, roles: auth.roles);

        await storage.putEncrypted(StorageKeys.authToken, auth.accessToken);
        await storage.putEncrypted(
            StorageKeys.authRefreshToken, auth.refreshToken);
        await storage.put(StorageKeys.tokenInfoKey, tokenInfo);

        print('AUTH TOKEN: ${storage.getEncrypted(StorageKeys.authToken)}');
        print(
            'REFRESH TOKEN: ${storage.getEncrypted(StorageKeys.authRefreshToken)}');
        print('INFO: ${await storage.get(StorageKeys.tokenInfoKey)}');
      }
      return auth;
    } on DioException catch (e) {
      appState.state = AppState.error(e.message);

      // ref.read(appStateProvider.notifier).state = AppState.error(e.message);
      state = AsyncValue.error(e, StackTrace.empty);
      throw Exception('Error: ');
    }
  }

  void logout() async {
    final storage = await ref.watch(hiveProvider.future);
    await storage.deleteCredentials();
    // await storage.delete(StorageKeys.tokenInfoKey);
    final appState = ref.read(appStateProvider.notifier);
    final goRouter = ref.read(goRouterProvider);

    appState.state = const AppState.unauthorized();
    goRouter.go('/home');
  }
}
