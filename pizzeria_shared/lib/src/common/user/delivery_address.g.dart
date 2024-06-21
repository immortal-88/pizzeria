// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryAddressImpl _$$DeliveryAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryAddressImpl(
      location: LatLng.fromJson(json['location'] as Map<String, dynamic>),
      street: json['street'] as String,
      city: json['city'] as String,
      building: json['building'] as String,
      entrance: json['entrance'] as int?,
      floor: json['floor'] as int?,
      flatNumber: json['flatNumber'] as String?,
    );

Map<String, dynamic> _$$DeliveryAddressImplToJson(
        _$DeliveryAddressImpl instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'street': instance.street,
      'city': instance.city,
      'building': instance.building,
      'entrance': instance.entrance,
      'floor': instance.floor,
      'flatNumber': instance.flatNumber,
    };
