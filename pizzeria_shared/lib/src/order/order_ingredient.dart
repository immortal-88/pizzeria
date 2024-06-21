import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

part 'order_ingredient.freezed.dart';
part 'order_ingredient.g.dart';

@freezed
class OrderIngredient with _$OrderIngredient {
  const factory OrderIngredient({
    required Ingredient ingredient,
    required int quantity,
    required double price,
  }) = _OrderIngredient;

  const OrderIngredient._();

  factory OrderIngredient.fromJson(Map<String, dynamic> json) =>
      _$OrderIngredientFromJson(json);
}
