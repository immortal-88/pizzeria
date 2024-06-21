import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {@ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
      required String email,
      required String password,
      String? firstName,
      String? lastName,
      String? photoUrl,
      required List<String> roles}) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
