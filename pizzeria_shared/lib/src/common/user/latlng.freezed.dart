// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latlng.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return _LatLng.fromJson(json);
}

/// @nodoc
mixin _$LatLng {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLngCopyWith<LatLng> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLngCopyWith<$Res> {
  factory $LatLngCopyWith(LatLng value, $Res Function(LatLng) then) =
      _$LatLngCopyWithImpl<$Res, LatLng>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LatLngCopyWithImpl<$Res, $Val extends LatLng>
    implements $LatLngCopyWith<$Res> {
  _$LatLngCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LatLngImplCopyWith<$Res> implements $LatLngCopyWith<$Res> {
  factory _$$LatLngImplCopyWith(
          _$LatLngImpl value, $Res Function(_$LatLngImpl) then) =
      __$$LatLngImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$LatLngImplCopyWithImpl<$Res>
    extends _$LatLngCopyWithImpl<$Res, _$LatLngImpl>
    implements _$$LatLngImplCopyWith<$Res> {
  __$$LatLngImplCopyWithImpl(
      _$LatLngImpl _value, $Res Function(_$LatLngImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LatLngImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatLngImpl extends _LatLng {
  const _$LatLngImpl({required this.latitude, required this.longitude})
      : super._();

  factory _$LatLngImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatLngImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatLngImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LatLngImplCopyWith<_$LatLngImpl> get copyWith =>
      __$$LatLngImplCopyWithImpl<_$LatLngImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatLngImplToJson(
      this,
    );
  }
}

abstract class _LatLng extends LatLng {
  const factory _LatLng(
      {required final double latitude,
      required final double longitude}) = _$LatLngImpl;
  const _LatLng._() : super._();

  factory _LatLng.fromJson(Map<String, dynamic> json) = _$LatLngImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LatLngImplCopyWith<_$LatLngImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
