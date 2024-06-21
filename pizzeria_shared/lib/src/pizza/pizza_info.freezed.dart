// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pizza_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PizzaInfo _$PizzaInfoFromJson(Map<String, dynamic> json) {
  return _PizzaInfo.fromJson(json);
}

/// @nodoc
mixin _$PizzaInfo {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PizzaInfoCopyWith<PizzaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaInfoCopyWith<$Res> {
  factory $PizzaInfoCopyWith(PizzaInfo value, $Res Function(PizzaInfo) then) =
      _$PizzaInfoCopyWithImpl<$Res, PizzaInfo>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String name,
      String description,
      double price,
      String imageUrl,
      bool isAvailable,
      List<Ingredient> ingredients,
      double? rating,
      int weight});
}

/// @nodoc
class _$PizzaInfoCopyWithImpl<$Res, $Val extends PizzaInfo>
    implements $PizzaInfoCopyWith<$Res> {
  _$PizzaInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? isAvailable = null,
    Object? ingredients = null,
    Object? rating = freezed,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PizzaInfoImplCopyWith<$Res>
    implements $PizzaInfoCopyWith<$Res> {
  factory _$$PizzaInfoImplCopyWith(
          _$PizzaInfoImpl value, $Res Function(_$PizzaInfoImpl) then) =
      __$$PizzaInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String name,
      String description,
      double price,
      String imageUrl,
      bool isAvailable,
      List<Ingredient> ingredients,
      double? rating,
      int weight});
}

/// @nodoc
class __$$PizzaInfoImplCopyWithImpl<$Res>
    extends _$PizzaInfoCopyWithImpl<$Res, _$PizzaInfoImpl>
    implements _$$PizzaInfoImplCopyWith<$Res> {
  __$$PizzaInfoImplCopyWithImpl(
      _$PizzaInfoImpl _value, $Res Function(_$PizzaInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? isAvailable = null,
    Object? ingredients = null,
    Object? rating = freezed,
    Object? weight = null,
  }) {
    return _then(_$PizzaInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PizzaInfoImpl extends _PizzaInfo {
  const _$PizzaInfoImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.isAvailable,
      required final List<Ingredient> ingredients,
      this.rating,
      required this.weight})
      : _ingredients = ingredients,
        super._();

  factory _$PizzaInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PizzaInfoImplFromJson(json);

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  final dynamic id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final bool isAvailable;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final double? rating;
  @override
  final int weight;

  @override
  String toString() {
    return 'PizzaInfo(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable, ingredients: $ingredients, rating: $rating, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PizzaInfoImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      name,
      description,
      price,
      imageUrl,
      isAvailable,
      const DeepCollectionEquality().hash(_ingredients),
      rating,
      weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PizzaInfoImplCopyWith<_$PizzaInfoImpl> get copyWith =>
      __$$PizzaInfoImplCopyWithImpl<_$PizzaInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PizzaInfoImplToJson(
      this,
    );
  }
}

abstract class _PizzaInfo extends PizzaInfo {
  const factory _PizzaInfo(
      {@ObjectIdConverter() @JsonKey(name: '_id') required final dynamic id,
      required final String name,
      required final String description,
      required final double price,
      required final String imageUrl,
      required final bool isAvailable,
      required final List<Ingredient> ingredients,
      final double? rating,
      required final int weight}) = _$PizzaInfoImpl;
  const _PizzaInfo._() : super._();

  factory _PizzaInfo.fromJson(Map<String, dynamic> json) =
      _$PizzaInfoImpl.fromJson;

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  bool get isAvailable;
  @override
  List<Ingredient> get ingredients;
  @override
  double? get rating;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$$PizzaInfoImplCopyWith<_$PizzaInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
