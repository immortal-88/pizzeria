// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['_id'],
      type: $enumDecode(_$ProductTypeEnumMap, json['type']),
      size: $enumDecode(_$SizeInfoEnumMap, json['size']),
      crust: $enumDecodeNullable(_$CrustInfoEnumMap, json['crust']),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => OrderIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: json['quantity'] as int,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': _$ProductTypeEnumMap[instance.type]!,
      'size': _$SizeInfoEnumMap[instance.size]!,
      'crust': _$CrustInfoEnumMap[instance.crust],
      'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'price': instance.price,
    };

const _$ProductTypeEnumMap = {
  ProductType.pizza: 'pizza',
  ProductType.drink: 'drink',
  ProductType.side: 'side',
  ProductType.dessert: 'dessert',
};

const _$SizeInfoEnumMap = {
  SizeInfo.small: 'small',
  SizeInfo.medium: 'medium',
  SizeInfo.large: 'large',
  SizeInfo.xlarge: 'xlarge',
  SizeInfo.xxlarge: 'xxlarge',
};

const _$CrustInfoEnumMap = {
  CrustInfo.thin: 'thin',
  CrustInfo.thick: 'thick',
  CrustInfo.philadelphia: 'philadelphia',
  CrustInfo.hotdog: 'hotdog',
};
