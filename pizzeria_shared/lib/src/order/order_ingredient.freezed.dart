// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderIngredient _$OrderIngredientFromJson(Map<String, dynamic> json) {
  return _OrderIngredient.fromJson(json);
}

/// @nodoc
mixin _$OrderIngredient {
  Ingredient get ingredient => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderIngredientCopyWith<OrderIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderIngredientCopyWith<$Res> {
  factory $OrderIngredientCopyWith(
          OrderIngredient value, $Res Function(OrderIngredient) then) =
      _$OrderIngredientCopyWithImpl<$Res, OrderIngredient>;
  @useResult
  $Res call({Ingredient ingredient, int quantity, double price});

  $IngredientCopyWith<$Res> get ingredient;
}

/// @nodoc
class _$OrderIngredientCopyWithImpl<$Res, $Val extends OrderIngredient>
    implements $OrderIngredientCopyWith<$Res> {
  _$OrderIngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredient = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as Ingredient,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IngredientCopyWith<$Res> get ingredient {
    return $IngredientCopyWith<$Res>(_value.ingredient, (value) {
      return _then(_value.copyWith(ingredient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderIngredientImplCopyWith<$Res>
    implements $OrderIngredientCopyWith<$Res> {
  factory _$$OrderIngredientImplCopyWith(_$OrderIngredientImpl value,
          $Res Function(_$OrderIngredientImpl) then) =
      __$$OrderIngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ingredient ingredient, int quantity, double price});

  @override
  $IngredientCopyWith<$Res> get ingredient;
}

/// @nodoc
class __$$OrderIngredientImplCopyWithImpl<$Res>
    extends _$OrderIngredientCopyWithImpl<$Res, _$OrderIngredientImpl>
    implements _$$OrderIngredientImplCopyWith<$Res> {
  __$$OrderIngredientImplCopyWithImpl(
      _$OrderIngredientImpl _value, $Res Function(_$OrderIngredientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredient = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$OrderIngredientImpl(
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as Ingredient,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderIngredientImpl extends _OrderIngredient {
  const _$OrderIngredientImpl(
      {required this.ingredient, required this.quantity, required this.price})
      : super._();

  factory _$OrderIngredientImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderIngredientImplFromJson(json);

  @override
  final Ingredient ingredient;
  @override
  final int quantity;
  @override
  final double price;

  @override
  String toString() {
    return 'OrderIngredient(ingredient: $ingredient, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderIngredientImpl &&
            (identical(other.ingredient, ingredient) ||
                other.ingredient == ingredient) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ingredient, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderIngredientImplCopyWith<_$OrderIngredientImpl> get copyWith =>
      __$$OrderIngredientImplCopyWithImpl<_$OrderIngredientImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderIngredientImplToJson(
      this,
    );
  }
}

abstract class _OrderIngredient extends OrderIngredient {
  const factory _OrderIngredient(
      {required final Ingredient ingredient,
      required final int quantity,
      required final double price}) = _$OrderIngredientImpl;
  const _OrderIngredient._() : super._();

  factory _OrderIngredient.fromJson(Map<String, dynamic> json) =
      _$OrderIngredientImpl.fromJson;

  @override
  Ingredient get ingredient;
  @override
  int get quantity;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$OrderIngredientImplCopyWith<_$OrderIngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
