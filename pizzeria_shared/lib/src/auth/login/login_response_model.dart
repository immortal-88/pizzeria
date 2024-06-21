import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';
import 'package:pizzeria_shared/src/common/user/user_short.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
    required UserShort user,
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponseModel;

  const LoginResponseModel._();

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
