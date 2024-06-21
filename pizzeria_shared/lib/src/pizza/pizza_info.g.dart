// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PizzaInfoImpl _$$PizzaInfoImplFromJson(Map<String, dynamic> json) =>
    _$PizzaInfoImpl(
      id: json['_id'],
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      isAvailable: json['isAvailable'] as bool,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$$PizzaInfoImplToJson(_$PizzaInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'isAvailable': instance.isAvailable,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'rating': instance.rating,
      'weight': instance.weight,
    };
