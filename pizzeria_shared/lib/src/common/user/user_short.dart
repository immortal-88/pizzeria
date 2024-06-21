import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';

part 'user_short.freezed.dart';
part 'user_short.g.dart';

@freezed
class UserShort with _$UserShort {
  const factory UserShort(
      {@ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
      String? firstName,
      String? lastName,
      String? photoUrl}) = _UserShort;

  const UserShort._();

  factory UserShort.fromJson(Map<String, dynamic> json) =>
      _$UserShortFromJson(json);
}
