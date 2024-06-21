// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) {
  return _ClientInfo.fromJson(json);
}

/// @nodoc
mixin _$ClientInfo {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DeliveryAddress? get deliveryAddress => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientInfoCopyWith<ClientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientInfoCopyWith<$Res> {
  factory $ClientInfoCopyWith(
          ClientInfo value, $Res Function(ClientInfo) then) =
      _$ClientInfoCopyWithImpl<$Res, ClientInfo>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      DeliveryAddress? deliveryAddress,
      String? photoUrl});

  $DeliveryAddressCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class _$ClientInfoCopyWithImpl<$Res, $Val extends ClientInfo>
    implements $ClientInfoCopyWith<$Res> {
  _$ClientInfoCopyWithImpl(this._value, this._then);

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
    Object? phoneNumber = freezed,
    Object? deliveryAddress = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddress?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressCopyWith<$Res>? get deliveryAddress {
    if (_value.deliveryAddress == null) {
      return null;
    }

    return $DeliveryAddressCopyWith<$Res>(_value.deliveryAddress!, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientInfoImplCopyWith<$Res>
    implements $ClientInfoCopyWith<$Res> {
  factory _$$ClientInfoImplCopyWith(
          _$ClientInfoImpl value, $Res Function(_$ClientInfoImpl) then) =
      __$$ClientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      DeliveryAddress? deliveryAddress,
      String? photoUrl});

  @override
  $DeliveryAddressCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class __$$ClientInfoImplCopyWithImpl<$Res>
    extends _$ClientInfoCopyWithImpl<$Res, _$ClientInfoImpl>
    implements _$$ClientInfoImplCopyWith<$Res> {
  __$$ClientInfoImplCopyWithImpl(
      _$ClientInfoImpl _value, $Res Function(_$ClientInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? deliveryAddress = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$ClientInfoImpl(
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddress?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientInfoImpl extends _ClientInfo {
  const _$ClientInfoImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') required this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.deliveryAddress,
      this.photoUrl})
      : super._();

  factory _$ClientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientInfoImplFromJson(json);

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
  final String? phoneNumber;
  @override
  final DeliveryAddress? deliveryAddress;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'ClientInfo(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, deliveryAddress: $deliveryAddress, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientInfoImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      firstName,
      lastName,
      email,
      phoneNumber,
      deliveryAddress,
      photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientInfoImplCopyWith<_$ClientInfoImpl> get copyWith =>
      __$$ClientInfoImplCopyWithImpl<_$ClientInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientInfoImplToJson(
      this,
    );
  }
}

abstract class _ClientInfo extends ClientInfo {
  const factory _ClientInfo(
      {@ObjectIdConverter() @JsonKey(name: '_id') required final dynamic id,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? phoneNumber,
      final DeliveryAddress? deliveryAddress,
      final String? photoUrl}) = _$ClientInfoImpl;
  const _ClientInfo._() : super._();

  factory _ClientInfo.fromJson(Map<String, dynamic> json) =
      _$ClientInfoImpl.fromJson;

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
  String? get phoneNumber;
  @override
  DeliveryAddress? get deliveryAddress;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$ClientInfoImplCopyWith<_$ClientInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
