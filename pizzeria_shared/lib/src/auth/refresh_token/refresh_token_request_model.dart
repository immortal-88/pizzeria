import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_request_model.freezed.dart';
part 'refresh_token_request_model.g.dart';

@freezed
class RefreshTokenRequestModel with _$RefreshTokenRequestModel {
  const factory RefreshTokenRequestModel({
    required String userId,
    required String refreshToken,
    String? deviceId,
  }) = _RefreshTokenRequestModel;

  const RefreshTokenRequestModel._();

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);
}
