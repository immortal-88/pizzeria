// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  ProductType get type => throw _privateConstructorUsedError;
  SizeInfo get size => throw _privateConstructorUsedError;
  CrustInfo? get crust => throw _privateConstructorUsedError;
  List<OrderIngredient>? get ingredients => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      ProductType type,
      SizeInfo size,
      CrustInfo? crust,
      List<OrderIngredient>? ingredients,
      int quantity,
      String imageUrl,
      String name,
      double price});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? size = null,
    Object? crust = freezed,
    Object? ingredients = freezed,
    Object? quantity = null,
    Object? imageUrl = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductType,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as SizeInfo,
      crust: freezed == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as CrustInfo?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<OrderIngredient>?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      ProductType type,
      SizeInfo size,
      CrustInfo? crust,
      List<OrderIngredient>? ingredients,
      int quantity,
      String imageUrl,
      String name,
      double price});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? size = null,
    Object? crust = freezed,
    Object? ingredients = freezed,
    Object? quantity = null,
    Object? imageUrl = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$OrderItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductType,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as SizeInfo,
      crust: freezed == crust
          ? _value.crust
          : crust // ignore: cast_nullable_to_non_nullable
              as CrustInfo?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<OrderIngredient>?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl extends _OrderItem {
  const _$OrderItemImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') required this.id,
      required this.type,
      required this.size,
      this.crust,
      final List<OrderIngredient>? ingredients,
      required this.quantity,
      required this.imageUrl,
      required this.name,
      required this.price})
      : _ingredients = ingredients,
        super._();

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  final dynamic id;
  @override
  final ProductType type;
  @override
  final SizeInfo size;
  @override
  final CrustInfo? crust;
  final List<OrderIngredient>? _ingredients;
  @override
  List<OrderIngredient>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int quantity;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'OrderItem(id: $id, type: $type, size: $size, crust: $crust, ingredients: $ingredients, quantity: $quantity, imageUrl: $imageUrl, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.crust, crust) || other.crust == crust) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      type,
      size,
      crust,
      const DeepCollectionEquality().hash(_ingredients),
      quantity,
      imageUrl,
      name,
      price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem extends OrderItem {
  const factory _OrderItem(
      {@ObjectIdConverter() @JsonKey(name: '_id') required final dynamic id,
      required final ProductType type,
      required final SizeInfo size,
      final CrustInfo? crust,
      final List<OrderIngredient>? ingredients,
      required final int quantity,
      required final String imageUrl,
      required final String name,
      required final double price}) = _$OrderItemImpl;
  const _OrderItem._() : super._();

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id;
  @override
  ProductType get type;
  @override
  SizeInfo get size;
  @override
  CrustInfo? get crust;
  @override
  List<OrderIngredient>? get ingredients;
  @override
  int get quantity;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
