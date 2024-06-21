import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/features/auth/data/token_info_response.dart';

part 'app_state.freezed.dart';

enum AppRole { admin, user }

final appStateProvider =
    StateProvider<AppState>((_) => const AppState.unauthorized());

@freezed
class AppState with _$AppState {
  const factory AppState.authorized(TokenInfoResponse login) = Authorized;

  const factory AppState.unauthorized() = Unauthorized;

  const factory AppState.error([String? message]) = Error;
}
