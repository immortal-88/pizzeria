// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatedOrderImpl _$$CreatedOrderImplFromJson(Map<String, dynamic> json) =>
    _$CreatedOrderImpl(
      id: json['_id'],
      orderNumber: json['orderNumber'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      clientInfo:
          ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      phoneNumber: json['phoneNumber'] as String?,
      totalCost: (json['totalCost'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreatedOrderImplToJson(_$CreatedOrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderNumber': instance.orderNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'items': instance.items,
      'clientInfo': instance.clientInfo.toJson(),
      'status': _$OrderStatusEnumMap[instance.status],
      'phoneNumber': instance.phoneNumber,
      'totalCost': instance.totalCost,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.confirming: 'confirming',
  OrderStatus.makeline: 'makeline',
  OrderStatus.owen: 'owen',
  OrderStatus.inTheBox: 'in the box',
  OrderStatus.delivery: 'delivery',
  OrderStatus.completed: 'completed',
};
