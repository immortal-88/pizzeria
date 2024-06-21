import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus {
  @JsonValue('confirming')
  confirming,
  @JsonValue('makeline')
  makeline,
  @JsonValue('owen')
  owen,
  @JsonValue('in the box')
  inTheBox,
  @JsonValue('delivery')
  delivery,
  @JsonValue('completed')
  completed,
}

@freezed
class Order with _$Order {
  const factory Order({
    @ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
    String? orderNumber,
    required DateTime createdAt,
    required List<OrderItem> items,
    required ClientInfo clientInfo,
    OrderStatus? status,
    String? phoneNumber,
    required double totalCost,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
