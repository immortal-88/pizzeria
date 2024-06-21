// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderIngredientImpl _$$OrderIngredientImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderIngredientImpl(
      ingredient:
          Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderIngredientImplToJson(
        _$OrderIngredientImpl instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient.toJson(),
      'quantity': instance.quantity,
      'price': instance.price,
    };
