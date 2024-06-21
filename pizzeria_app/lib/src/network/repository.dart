import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/constants/constants.dart';
import 'package:pizzeria_app/src/database/hive_provider.dart';
import 'package:pizzeria_app/src/database/storage_keys.dart';
import 'package:pizzeria_app/src/features/auth/data/auth_api.dart';
import 'package:pizzeria_app/src/features/auth/data/token_info_response.dart';
import 'package:pizzeria_app/src/features/cart/data/api/orders_api.dart';
import 'package:pizzeria_app/src/features/pizzas/data/pizzas_api.dart';
import 'package:pizzeria_app/src/features/profile/data/profile_api.dart';
import 'package:pizzeria_app/src/routing/router.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

final repositoryProvider = Provider<Repository>(
    (ref) => Repository(baseUrl: Constants.baseUrl, ref: ref));

class Repository {
  final Dio _dio;

  late PizzasApi _pizzasApi;
  late OrdersApi _ordersApi;
  late AuthApi _authApi;
  late ProfileApi _profileApi;

  PizzasApi get pizzasApi => _pizzasApi;
  OrdersApi get ordersApi => _ordersApi;
  AuthApi get authApi => _authApi;
  ProfileApi get profileApi => _profileApi;

  Repository({required String baseUrl, required ProviderRef<Repository> ref})
      : _dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60))) {
    _dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        final storage = await ref.read(hiveProvider.future);

        final authToken = await storage.getEncrypted(StorageKeys.authToken);
        log('AUTH TOKEN from storage $authToken');
        if (authToken != null) {
          options.headers['Authorization'] = authToken;
        }
        handler.next(options);
      },
      onResponse: (e, handler) async => handler.next(e),
      onError: (e, handler) async {
        final goRouter = ref.read(goRouterProvider);
        if (e.response?.statusCode == 401) {
          var storage = await ref.read(hiveProvider.future);
          final refreshToken =
              storage.getEncrypted<String?>(StorageKeys.authRefreshToken);

          log('REFRESH TOKEN $refreshToken');

          if (refreshToken != null) {
            try {
              final tokenInfo =
                  storage.get<TokenInfoResponse>(StorageKeys.tokenInfoKey);

              var refreshResponse =
                  await AuthApi(Dio(BaseOptions(baseUrl: baseUrl)))
                      .refreshToken(
                RefreshTokenRequestModel(
                  refreshToken: refreshToken,
                  userId: tokenInfo!.userId,
                ),
              );

              await storage.putEncrypted(
                  StorageKeys.authToken, refreshResponse.accessToken);
              await storage.putEncrypted(
                  StorageKeys.authRefreshToken, refreshResponse.refreshToken);

              final rsp = await _dio.fetch(e.requestOptions);
              if (rsp.statusCode == 200) {
                handler.resolve(rsp);
              }
              return;
            } on DioException catch (e) {
              if (e.response?.statusCode == 403) {
                goRouter.push('/login');
              }
            } catch (e) {
              rethrow;
            }
          }
        }

        //TODO Check different responses messages
        var errorDescription = '';
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            errorDescription = 'Connection timeout';
            break;
          case DioExceptionType.cancel:
            errorDescription = 'Request cancelled';
            break;
          case DioExceptionType.badCertificate:
            errorDescription = 'Bad certificate';
            break;
          case DioExceptionType.badResponse:
            errorDescription = 'Bad response';
            break;
          case DioExceptionType.connectionError:
            errorDescription = 'Connection error';
            break;
          case DioExceptionType.unknown:
            errorDescription = 'Unknown error';
            break;
        }
        handler.next(DioException(
            requestOptions: e.requestOptions, error: errorDescription));
      },
    ));

    _pizzasApi = PizzasApi(_dio);
    _ordersApi = OrdersApi(_dio);
    _authApi = AuthApi(_dio);
    _profileApi = ProfileApi(_dio);
  }
}
