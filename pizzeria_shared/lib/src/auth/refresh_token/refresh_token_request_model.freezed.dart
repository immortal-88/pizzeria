// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshTokenRequestModel _$RefreshTokenRequestModelFromJson(
    Map<String, dynamic> json) {
  return _RefreshTokenRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenRequestModel {
  String get userId => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenRequestModelCopyWith<RefreshTokenRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenRequestModelCopyWith<$Res> {
  factory $RefreshTokenRequestModelCopyWith(RefreshTokenRequestModel value,
          $Res Function(RefreshTokenRequestModel) then) =
      _$RefreshTokenRequestModelCopyWithImpl<$Res, RefreshTokenRequestModel>;
  @useResult
  $Res call({String userId, String refreshToken, String? deviceId});
}

/// @nodoc
class _$RefreshTokenRequestModelCopyWithImpl<$Res,
        $Val extends RefreshTokenRequestModel>
    implements $RefreshTokenRequestModelCopyWith<$Res> {
  _$RefreshTokenRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? refreshToken = null,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenRequestModelImplCopyWith<$Res>
    implements $RefreshTokenRequestModelCopyWith<$Res> {
  factory _$$RefreshTokenRequestModelImplCopyWith(
          _$RefreshTokenRequestModelImpl value,
          $Res Function(_$RefreshTokenRequestModelImpl) then) =
      __$$RefreshTokenRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String refreshToken, String? deviceId});
}

/// @nodoc
class __$$RefreshTokenRequestModelImplCopyWithImpl<$Res>
    extends _$RefreshTokenRequestModelCopyWithImpl<$Res,
        _$RefreshTokenRequestModelImpl>
    implements _$$RefreshTokenRequestModelImplCopyWith<$Res> {
  __$$RefreshTokenRequestModelImplCopyWithImpl(
      _$RefreshTokenRequestModelImpl _value,
      $Res Function(_$RefreshTokenRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? refreshToken = null,
    Object? deviceId = freezed,
  }) {
    return _then(_$RefreshTokenRequestModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenRequestModelImpl extends _RefreshTokenRequestModel {
  const _$RefreshTokenRequestModelImpl(
      {required this.userId, required this.refreshToken, this.deviceId})
      : super._();

  factory _$RefreshTokenRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenRequestModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String refreshToken;
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'RefreshTokenRequestModel(userId: $userId, refreshToken: $refreshToken, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenRequestModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, refreshToken, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenRequestModelImplCopyWith<_$RefreshTokenRequestModelImpl>
      get copyWith => __$$RefreshTokenRequestModelImplCopyWithImpl<
          _$RefreshTokenRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenRequestModel extends RefreshTokenRequestModel {
  const factory _RefreshTokenRequestModel(
      {required final String userId,
      required final String refreshToken,
      final String? deviceId}) = _$RefreshTokenRequestModelImpl;
  const _RefreshTokenRequestModel._() : super._();

  factory _RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenRequestModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get refreshToken;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$RefreshTokenRequestModelImplCopyWith<_$RefreshTokenRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
