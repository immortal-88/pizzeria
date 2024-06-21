import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

part 'created_order.freezed.dart';
part 'created_order.g.dart';

@freezed
class CreatedOrder with _$CreatedOrder {
  const factory CreatedOrder({
    @ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
    String? orderNumber,
    required DateTime createdAt,
    required List<Map<String, dynamic>> items,
    required ClientInfo clientInfo,
    OrderStatus? status,
    String? phoneNumber,
    required double totalCost,
  }) = _CreatedOrder;

  const CreatedOrder._();

  factory CreatedOrder.fromJson(Map<String, dynamic> json) =>
      _$CreatedOrderFromJson(json);
}
