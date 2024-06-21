// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginModelImpl _$$UserLoginModelImplFromJson(Map<String, dynamic> json) =>
    _$UserLoginModelImpl(
      id: json['_id'],
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserLoginModelImplToJson(
        _$UserLoginModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'roles': instance.roles,
    };
