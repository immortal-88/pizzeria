// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserShortImpl _$$UserShortImplFromJson(Map<String, dynamic> json) =>
    _$UserShortImpl(
      id: json['_id'],
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$UserShortImplToJson(_$UserShortImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
    };
