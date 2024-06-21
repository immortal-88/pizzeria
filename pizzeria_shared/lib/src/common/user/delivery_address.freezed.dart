// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) {
  return _DeliveryAddress.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddress {
  LatLng get location => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get building => throw _privateConstructorUsedError;
  int? get entrance => throw _privateConstructorUsedError;
  int? get floor => throw _privateConstructorUsedError;
  String? get flatNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryAddressCopyWith<DeliveryAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressCopyWith<$Res> {
  factory $DeliveryAddressCopyWith(
          DeliveryAddress value, $Res Function(DeliveryAddress) then) =
      _$DeliveryAddressCopyWithImpl<$Res, DeliveryAddress>;
  @useResult
  $Res call(
      {LatLng location,
      String street,
      String city,
      String building,
      int? entrance,
      int? floor,
      String? flatNumber});

  $LatLngCopyWith<$Res> get location;
}

/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res, $Val extends DeliveryAddress>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? street = null,
    Object? city = null,
    Object? building = null,
    Object? entrance = freezed,
    Object? floor = freezed,
    Object? flatNumber = freezed,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      building: null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      entrance: freezed == entrance
          ? _value.entrance
          : entrance // ignore: cast_nullable_to_non_nullable
              as int?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLngCopyWith<$Res> get location {
    return $LatLngCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryAddressImplCopyWith<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  factory _$$DeliveryAddressImplCopyWith(_$DeliveryAddressImpl value,
          $Res Function(_$DeliveryAddressImpl) then) =
      __$$DeliveryAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LatLng location,
      String street,
      String city,
      String building,
      int? entrance,
      int? floor,
      String? flatNumber});

  @override
  $LatLngCopyWith<$Res> get location;
}

/// @nodoc
class __$$DeliveryAddressImplCopyWithImpl<$Res>
    extends _$DeliveryAddressCopyWithImpl<$Res, _$DeliveryAddressImpl>
    implements _$$DeliveryAddressImplCopyWith<$Res> {
  __$$DeliveryAddressImplCopyWithImpl(
      _$DeliveryAddressImpl _value, $Res Function(_$DeliveryAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? street = null,
    Object? city = null,
    Object? building = null,
    Object? entrance = freezed,
    Object? floor = freezed,
    Object? flatNumber = freezed,
  }) {
    return _then(_$DeliveryAddressImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      building: null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      entrance: freezed == entrance
          ? _value.entrance
          : entrance // ignore: cast_nullable_to_non_nullable
              as int?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressImpl extends _DeliveryAddress {
  const _$DeliveryAddressImpl(
      {required this.location,
      required this.street,
      required this.city,
      required this.building,
      this.entrance,
      this.floor,
      required this.flatNumber})
      : super._();

  factory _$DeliveryAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressImplFromJson(json);

  @override
  final LatLng location;
  @override
  final String street;
  @override
  final String city;
  @override
  final String building;
  @override
  final int? entrance;
  @override
  final int? floor;
  @override
  final String? flatNumber;

  @override
  String toString() {
    return 'DeliveryAddress(location: $location, street: $street, city: $city, building: $building, entrance: $entrance, floor: $floor, flatNumber: $flatNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.entrance, entrance) ||
                other.entrance == entrance) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location, street, city, building,
      entrance, floor, flatNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      __$$DeliveryAddressImplCopyWithImpl<_$DeliveryAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressImplToJson(
      this,
    );
  }
}

abstract class _DeliveryAddress extends DeliveryAddress {
  const factory _DeliveryAddress(
      {required final LatLng location,
      required final String street,
      required final String city,
      required final String building,
      final int? entrance,
      final int? floor,
      required final String? flatNumber}) = _$DeliveryAddressImpl;
  const _DeliveryAddress._() : super._();

  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressImpl.fromJson;

  @override
  LatLng get location;
  @override
  String get street;
  @override
  String get city;
  @override
  String get building;
  @override
  int? get entrance;
  @override
  int? get floor;
  @override
  String? get flatNumber;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
