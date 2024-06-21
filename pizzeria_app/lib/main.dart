import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/app.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/database/hive_provider.dart';
import 'package:pizzeria_app/src/database/storage_keys.dart';
import 'package:pizzeria_app/src/features/auth/data/token_info_response.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_app/src/routing/router.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  final container = ProviderContainer();
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await container.read(hiveProvider.future);
    container.read(repositoryProvider);
    final storage = await container.read(hiveProvider.future);
    container.read(goRouterProvider);
    final appState = container.read(appStateProvider.notifier);

    // Init app state on start
    // storage.deleteEncrypted(StorageKeys.authToken);
    final tokenInfo = storage.get(StorageKeys.tokenInfoKey);
    log('🚀 TOKEN INFO: $tokenInfo');
    var hasInfo = tokenInfo != null;

    if (hasInfo) {
      try {
        appState.state = AppState.authorized(tokenInfo as TokenInfoResponse);
      } catch (e) {
        appState.state = const AppState.unauthorized();
      }
    }

    return runApp(ProviderScope(parent: container, child: const PizzeriaApp()));
  }, (error, stack) {
    log('ERROR: $error, STACK: $stack');
  });
}
