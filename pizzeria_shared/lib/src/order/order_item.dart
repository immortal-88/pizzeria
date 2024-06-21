import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem(
      {@ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
      required ProductType type,
      required SizeInfo size,
      CrustInfo? crust,
      List<OrderIngredient>? ingredients,
      required int quantity,
      required String imageUrl,
      required String name,
      required double price}) = _OrderItem;

  const OrderItem._();

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
