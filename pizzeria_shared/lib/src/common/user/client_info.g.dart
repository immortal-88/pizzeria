// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientInfoImpl _$$ClientInfoImplFromJson(Map<String, dynamic> json) =>
    _$ClientInfoImpl(
      id: json['_id'],
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      deliveryAddress: json['deliveryAddress'] == null
          ? null
          : DeliveryAddress.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>),
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$ClientInfoImplToJson(_$ClientInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'deliveryAddress': instance.deliveryAddress?.toJson(),
      'photoUrl': instance.photoUrl,
    };
