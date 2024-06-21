// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatedOrder _$CreatedOrderFromJson(Map<String, dynamic> json) {
  return _CreatedOrder.fromJson(json);
}

/// @nodoc
mixin _$CreatedOrder {
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id => throw _privateConstructorUsedError;
  String? get orderNumber => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get items => throw _privateConstructorUsedError;
  ClientInfo get clientInfo => throw _privateConstructorUsedError;
  OrderStatus? get status => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedOrderCopyWith<CreatedOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedOrderCopyWith<$Res> {
  factory $CreatedOrderCopyWith(
          CreatedOrder value, $Res Function(CreatedOrder) then) =
      _$CreatedOrderCopyWithImpl<$Res, CreatedOrder>;
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? orderNumber,
      DateTime createdAt,
      List<Map<String, dynamic>> items,
      ClientInfo clientInfo,
      OrderStatus? status,
      String? phoneNumber,
      double totalCost});

  $ClientInfoCopyWith<$Res> get clientInfo;
}

/// @nodoc
class _$CreatedOrderCopyWithImpl<$Res, $Val extends CreatedOrder>
    implements $CreatedOrderCopyWith<$Res> {
  _$CreatedOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderNumber = freezed,
    Object? createdAt = null,
    Object? items = null,
    Object? clientInfo = null,
    Object? status = freezed,
    Object? phoneNumber = freezed,
    Object? totalCost = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      clientInfo: null == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientInfoCopyWith<$Res> get clientInfo {
    return $ClientInfoCopyWith<$Res>(_value.clientInfo, (value) {
      return _then(_value.copyWith(clientInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatedOrderImplCopyWith<$Res>
    implements $CreatedOrderCopyWith<$Res> {
  factory _$$CreatedOrderImplCopyWith(
          _$CreatedOrderImpl value, $Res Function(_$CreatedOrderImpl) then) =
      __$$CreatedOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ObjectIdConverter() @JsonKey(name: '_id') dynamic id,
      String? orderNumber,
      DateTime createdAt,
      List<Map<String, dynamic>> items,
      ClientInfo clientInfo,
      OrderStatus? status,
      String? phoneNumber,
      double totalCost});

  @override
  $ClientInfoCopyWith<$Res> get clientInfo;
}

/// @nodoc
class __$$CreatedOrderImplCopyWithImpl<$Res>
    extends _$CreatedOrderCopyWithImpl<$Res, _$CreatedOrderImpl>
    implements _$$CreatedOrderImplCopyWith<$Res> {
  __$$CreatedOrderImplCopyWithImpl(
      _$CreatedOrderImpl _value, $Res Function(_$CreatedOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderNumber = freezed,
    Object? createdAt = null,
    Object? items = null,
    Object? clientInfo = null,
    Object? status = freezed,
    Object? phoneNumber = freezed,
    Object? totalCost = null,
  }) {
    return _then(_$CreatedOrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      clientInfo: null == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedOrderImpl extends _CreatedOrder {
  const _$CreatedOrderImpl(
      {@ObjectIdConverter() @JsonKey(name: '_id') this.id,
      this.orderNumber,
      required this.createdAt,
      required final List<Map<String, dynamic>> items,
      required this.clientInfo,
      this.status,
      this.phoneNumber,
      required this.totalCost})
      : _items = items,
        super._();

  factory _$CreatedOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedOrderImplFromJson(json);

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  final dynamic id;
  @override
  final String? orderNumber;
  @override
  final DateTime createdAt;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final ClientInfo clientInfo;
  @override
  final OrderStatus? status;
  @override
  final String? phoneNumber;
  @override
  final double totalCost;

  @override
  String toString() {
    return 'CreatedOrder(id: $id, orderNumber: $orderNumber, createdAt: $createdAt, items: $items, clientInfo: $clientInfo, status: $status, phoneNumber: $phoneNumber, totalCost: $totalCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedOrderImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.clientInfo, clientInfo) ||
                other.clientInfo == clientInfo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      orderNumber,
      createdAt,
      const DeepCollectionEquality().hash(_items),
      clientInfo,
      status,
      phoneNumber,
      totalCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedOrderImplCopyWith<_$CreatedOrderImpl> get copyWith =>
      __$$CreatedOrderImplCopyWithImpl<_$CreatedOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedOrderImplToJson(
      this,
    );
  }
}

abstract class _CreatedOrder extends CreatedOrder {
  const factory _CreatedOrder(
      {@ObjectIdConverter() @JsonKey(name: '_id') final dynamic id,
      final String? orderNumber,
      required final DateTime createdAt,
      required final List<Map<String, dynamic>> items,
      required final ClientInfo clientInfo,
      final OrderStatus? status,
      final String? phoneNumber,
      required final double totalCost}) = _$CreatedOrderImpl;
  const _CreatedOrder._() : super._();

  factory _CreatedOrder.fromJson(Map<String, dynamic> json) =
      _$CreatedOrderImpl.fromJson;

  @override
  @ObjectIdConverter()
  @JsonKey(name: '_id')
  dynamic get id;
  @override
  String? get orderNumber;
  @override
  DateTime get createdAt;
  @override
  List<Map<String, dynamic>> get items;
  @override
  ClientInfo get clientInfo;
  @override
  OrderStatus? get status;
  @override
  String? get phoneNumber;
  @override
  double get totalCost;
  @override
  @JsonKey(ignore: true)
  _$$CreatedOrderImplCopyWith<_$CreatedOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
