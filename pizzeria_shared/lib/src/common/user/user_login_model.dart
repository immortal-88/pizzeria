import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';

part 'user_login_model.freezed.dart';
part 'user_login_model.g.dart';

@freezed
class UserLoginModel with _$UserLoginModel {
  const factory UserLoginModel(
      {@ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
      String? firstName,
      String? lastName,
      String? email,
      String? photoUrl,
      required List<String> roles}) = _UserLoginModel;

  const UserLoginModel._();

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);
}
