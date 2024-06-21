// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['_id'],
      orderNumber: json['orderNumber'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientInfo:
          ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      phoneNumber: json['phoneNumber'] as String?,
      totalCost: (json['totalCost'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderNumber': instance.orderNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'items': instance.items.map((e) => e.toJson()).toList(),
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
