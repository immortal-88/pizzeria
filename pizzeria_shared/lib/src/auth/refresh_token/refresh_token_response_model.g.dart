// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenResponseModelImpl _$$RefreshTokenResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResponseModelImpl(
      id: json['_id'],
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      resendTime: DateTime.parse(json['resendTime'] as String),
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$RefreshTokenResponseModelImplToJson(
        _$RefreshTokenResponseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'resendTime': instance.resendTime.toIso8601String(),
      'deviceId': instance.deviceId,
    };
