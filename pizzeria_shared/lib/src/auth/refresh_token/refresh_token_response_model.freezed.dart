// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RefreshTokenResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponseModel {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  DateTime get resendTime => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenResponseModelCopyWith<RefreshTokenResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseModelCopyWith<$Res> {
  factory $RefreshTokenResponseModelCopyWith(RefreshTokenResponseModel value,
          $Res Function(RefreshTokenResponseModel) then) =
      _$RefreshTokenResponseModelCopyWithImpl<$Res, RefreshTokenResponseModel>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String accessToken,
      String refreshToken,
      DateTime resendTime,
      String? deviceId});
}

/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<$Res,
        $Val extends RefreshTokenResponseModel>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? resendTime = null,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      resendTime: null == resendTime
          ? _value.resendTime
          : resendTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenResponseModelImplCopyWith<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  factory _$$RefreshTokenResponseModelImplCopyWith(
          _$RefreshTokenResponseModelImpl value,
          $Res Function(_$RefreshTokenResponseModelImpl) then) =
      __$$RefreshTokenResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String accessToken,
      String refreshToken,
      DateTime resendTime,
      String? deviceId});
}

/// @nodoc
class __$$RefreshTokenResponseModelImplCopyWithImpl<$Res>
    extends _$RefreshTokenResponseModelCopyWithImpl<$Res,
        _$RefreshTokenResponseModelImpl>
    implements _$$RefreshTokenResponseModelImplCopyWith<$Res> {
  __$$RefreshTokenResponseModelImplCopyWithImpl(
      _$RefreshTokenResponseModelImpl _value,
      $Res Function(_$RefreshTokenResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? resendTime = null,
    Object? deviceId = freezed,
  }) {
    return _then(_$RefreshTokenResponseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      resendTime: null == resendTime
          ? _value.resendTime
          : resendTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenResponseModelImpl extends _RefreshTokenResponseModel {
  const _$RefreshTokenResponseModelImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') required this.id,
      required this.accessToken,
      required this.refreshToken,
      required this.resendTime,
      this.deviceId})
      : super._();

  factory _$RefreshTokenResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResponseModelImplFromJson(json);

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  final dynamic id;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final DateTime resendTime;
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'RefreshTokenResponseModel(id: $id, accessToken: $accessToken, refreshToken: $refreshToken, resendTime: $resendTime, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResponseModelImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.resendTime, resendTime) ||
                other.resendTime == resendTime) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      accessToken,
      refreshToken,
      resendTime,
      deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResponseModelImplCopyWith<_$RefreshTokenResponseModelImpl>
      get copyWith => __$$RefreshTokenResponseModelImplCopyWithImpl<
          _$RefreshTokenResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenResponseModel extends RefreshTokenResponseModel {
  const factory _RefreshTokenResponseModel(
      {@ObjectIdConverter() @JsonKey(name: '_id') required final dynamic id,
      required final String accessToken,
      required final String refreshToken,
      required final DateTime resendTime,
      final String? deviceId}) = _$RefreshTokenResponseModelImpl;
  const _RefreshTokenResponseModel._() : super._();

  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResponseModelImpl.fromJson;

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  DateTime get resendTime;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$RefreshTokenResponseModelImplCopyWith<_$RefreshTokenResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
