// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenInfoResponse _$TokenInfoResponseFromJson(Map<String, dynamic> json) {
  return _TokenInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenInfoResponse {
  @HiveField(0)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get deviceId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenInfoResponseCopyWith<TokenInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenInfoResponseCopyWith<$Res> {
  factory $TokenInfoResponseCopyWith(
          TokenInfoResponse value, $Res Function(TokenInfoResponse) then) =
      _$TokenInfoResponseCopyWithImpl<$Res, TokenInfoResponse>;
  @useResult
  $Res call(
      {@HiveField(0) String userId,
      @HiveField(1) String? deviceId,
      @HiveField(2) String? firstName,
      @HiveField(3) String? lastName,
      @HiveField(4) String? photoUrl});
}

/// @nodoc
class _$TokenInfoResponseCopyWithImpl<$Res, $Val extends TokenInfoResponse>
    implements $TokenInfoResponseCopyWith<$Res> {
  _$TokenInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? deviceId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TokenInfoResponseImplCopyWith<$Res>
    implements $TokenInfoResponseCopyWith<$Res> {
  factory _$$TokenInfoResponseImplCopyWith(_$TokenInfoResponseImpl value,
          $Res Function(_$TokenInfoResponseImpl) then) =
      __$$TokenInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String userId,
      @HiveField(1) String? deviceId,
      @HiveField(2) String? firstName,
      @HiveField(3) String? lastName,
      @HiveField(4) String? photoUrl});
}

/// @nodoc
class __$$TokenInfoResponseImplCopyWithImpl<$Res>
    extends _$TokenInfoResponseCopyWithImpl<$Res, _$TokenInfoResponseImpl>
    implements _$$TokenInfoResponseImplCopyWith<$Res> {
  __$$TokenInfoResponseImplCopyWithImpl(_$TokenInfoResponseImpl _value,
      $Res Function(_$TokenInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? deviceId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$TokenInfoResponseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TokenInfoResponseImpl implements _TokenInfoResponse {
  const _$TokenInfoResponseImpl(
      {@HiveField(0) required this.userId,
      @HiveField(1) this.deviceId,
      @HiveField(2) this.firstName,
      @HiveField(3) this.lastName,
      @HiveField(4) this.photoUrl});

  factory _$TokenInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenInfoResponseImplFromJson(json);

  @override
  @HiveField(0)
  final String userId;
  @override
  @HiveField(1)
  final String? deviceId;
  @override
  @HiveField(2)
  final String? firstName;
  @override
  @HiveField(3)
  final String? lastName;
  @override
  @HiveField(4)
  final String? photoUrl;

  @override
  String toString() {
    return 'TokenInfoResponse(userId: $userId, deviceId: $deviceId, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenInfoResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, deviceId, firstName, lastName, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenInfoResponseImplCopyWith<_$TokenInfoResponseImpl> get copyWith =>
      __$$TokenInfoResponseImplCopyWithImpl<_$TokenInfoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenInfoResponse implements TokenInfoResponse {
  const factory _TokenInfoResponse(
      {@HiveField(0) required final String userId,
      @HiveField(1) final String? deviceId,
      @HiveField(2) final String? firstName,
      @HiveField(3) final String? lastName,
      @HiveField(4) final String? photoUrl}) = _$TokenInfoResponseImpl;

  factory _TokenInfoResponse.fromJson(Map<String, dynamic> json) =
      _$TokenInfoResponseImpl.fromJson;

  @override
  @HiveField(0)
  String get userId;
  @override
  @HiveField(1)
  String? get deviceId;
  @override
  @HiveField(2)
  String? get firstName;
  @override
  @HiveField(3)
  String? get lastName;
  @override
  @HiveField(4)
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$TokenInfoResponseImplCopyWith<_$TokenInfoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
