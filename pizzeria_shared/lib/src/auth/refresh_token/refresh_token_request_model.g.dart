// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenRequestModelImpl _$$RefreshTokenRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenRequestModelImpl(
      userId: json['userId'] as String,
      refreshToken: json['refreshToken'] as String,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$RefreshTokenRequestModelImplToJson(
        _$RefreshTokenRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'deviceId': instance.deviceId,
    };
