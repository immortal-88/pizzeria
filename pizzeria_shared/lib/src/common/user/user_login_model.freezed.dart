// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) {
  return _UserLoginModel.fromJson(json);
}

/// @nodoc
mixin _$UserLoginModel {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginModelCopyWith<UserLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginModelCopyWith<$Res> {
  factory $UserLoginModelCopyWith(
          UserLoginModel value, $Res Function(UserLoginModel) then) =
      _$UserLoginModelCopyWithImpl<$Res, UserLoginModel>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? firstName,
      String? lastName,
      String? email,
      String? photoUrl,
      List<String> roles});
}

/// @nodoc
class _$UserLoginModelCopyWithImpl<$Res, $Val extends UserLoginModel>
    implements $UserLoginModelCopyWith<$Res> {
  _$UserLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? roles = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginModelImplCopyWith<$Res>
    implements $UserLoginModelCopyWith<$Res> {
  factory _$$UserLoginModelImplCopyWith(_$UserLoginModelImpl value,
          $Res Function(_$UserLoginModelImpl) then) =
      __$$UserLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? firstName,
      String? lastName,
      String? email,
      String? photoUrl,
      List<String> roles});
}

/// @nodoc
class __$$UserLoginModelImplCopyWithImpl<$Res>
    extends _$UserLoginModelCopyWithImpl<$Res, _$UserLoginModelImpl>
    implements _$$UserLoginModelImplCopyWith<$Res> {
  __$$UserLoginModelImplCopyWithImpl(
      _$UserLoginModelImpl _value, $Res Function(_$UserLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? roles = null,
  }) {
    return _then(_$UserLoginModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginModelImpl extends _UserLoginModel {
  const _$UserLoginModelImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') required this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.photoUrl,
      required final List<String> roles})
      : _roles = roles,
        super._();

  factory _$UserLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginModelImplFromJson(json);

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  final dynamic id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? photoUrl;
  final List<String> _roles;
  @override
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'UserLoginModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginModelImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      firstName,
      lastName,
      email,
      photoUrl,
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginModelImplCopyWith<_$UserLoginModelImpl> get copyWith =>
      __$$UserLoginModelImplCopyWithImpl<_$UserLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginModelImplToJson(
      this,
    );
  }
}

abstract class _UserLoginModel extends UserLoginModel {
  const factory _UserLoginModel(
      {@ObjectIdConverter() @JsonKey(name: '_id') required final dynamic id,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? photoUrl,
      required final List<String> roles}) = _$UserLoginModelImpl;
  const _UserLoginModel._() : super._();

  factory _UserLoginModel.fromJson(Map<String, dynamic> json) =
      _$UserLoginModelImpl.fromJson;

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get photoUrl;
  @override
  List<String> get roles;
  @override
  @JsonKey(ignore: true)
  _$$UserLoginModelImplCopyWith<_$UserLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
