// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenInfoResponseAdapter extends TypeAdapter<TokenInfoResponse> {
  @override
  final int typeId = 0;

  @override
  TokenInfoResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenInfoResponse(
      userId: fields[0] as String,
      deviceId: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      photoUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TokenInfoResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.deviceId)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenInfoResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenInfoResponseImpl _$$TokenInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenInfoResponseImpl(
      userId: json['userId'] as String,
      deviceId: json['deviceId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$TokenInfoResponseImplToJson(
        _$TokenInfoResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
    };
