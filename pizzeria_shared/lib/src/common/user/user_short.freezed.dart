// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_short.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserShort _$UserShortFromJson(Map<String, dynamic> json) {
  return _UserShort.fromJson(json);
}

/// @nodoc
mixin _$UserShort {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserShortCopyWith<UserShort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShortCopyWith<$Res> {
  factory $UserShortCopyWith(UserShort value, $Res Function(UserShort) then) =
      _$UserShortCopyWithImpl<$Res, UserShort>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? firstName,
      String? lastName,
      String? photoUrl});
}

/// @nodoc
class _$UserShortCopyWithImpl<$Res, $Val extends UserShort>
    implements $UserShortCopyWith<$Res> {
  _$UserShortCopyWithImpl(this._value, this._then);

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
    Object? photoUrl = freezed,
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
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserShortImplCopyWith<$Res>
    implements $UserShortCopyWith<$Res> {
  factory _$$UserShortImplCopyWith(
          _$UserShortImpl value, $Res Function(_$UserShortImpl) then) =
      __$$UserShortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? firstName,
      String? lastName,
      String? photoUrl});
}

/// @nodoc
class __$$UserShortImplCopyWithImpl<$Res>
    extends _$UserShortCopyWithImpl<$Res, _$UserShortImpl>
    implements _$$UserShortImplCopyWith<$Res> {
  __$$UserShortImplCopyWithImpl(
      _$UserShortImpl _value, $Res Function(_$UserShortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$UserShortImpl(
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
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserShortImpl extends _UserShort {
  const _$UserShortImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') required this.id,
      this.firstName,
      this.lastName,
      this.photoUrl})
      : super._();

  factory _$UserShortImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShortImplFromJson(json);

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  final dynamic id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'UserShort(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShortImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(id), firstName, lastName, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserShortImplCopyWith<_$UserShortImpl> get copyWith =>
      __$$UserShortImplCopyWithImpl<_$UserShortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserShortImplToJson(
      this,
    );
  }
}

abstract class _UserShort extends UserShort {
  const factory _UserShort(
      {@ObjectIdConverter() @JsonKey(name: '_id') required final dynamic id,
      final String? firstName,
      final String? lastName,
      final String? photoUrl}) = _$UserShortImpl;
  const _UserShort._() : super._();

  factory _UserShort.fromJson(Map<String, dynamic> json) =
      _$UserShortImpl.fromJson;

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$UserShortImplCopyWith<_$UserShortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
