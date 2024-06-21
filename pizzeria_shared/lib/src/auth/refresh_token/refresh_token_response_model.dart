import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';

part 'refresh_token_response_model.freezed.dart';
part 'refresh_token_response_model.g.dart';

@freezed
class RefreshTokenResponseModel with _$RefreshTokenResponseModel {
  const factory RefreshTokenResponseModel({
    @ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
    required String accessToken,
    required String refreshToken,
    required DateTime resendTime,
    String? deviceId,
  }) = _RefreshTokenResponseModel;

  const RefreshTokenResponseModel._();

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);
}
