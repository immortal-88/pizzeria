// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ordersControllerHash() => r'98de1e32854e43e353395614ffb3bbeb0712f37c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OrdersController
    extends BuildlessAutoDisposeAsyncNotifier<List<Order>> {
  late final dynamic args;

  FutureOr<List<Order>> build(
    dynamic args,
  );
}

/// See also [OrdersController].
@ProviderFor(OrdersController)
const ordersControllerProvider = OrdersControllerFamily();

/// See also [OrdersController].
class OrdersControllerFamily extends Family<AsyncValue<List<Order>>> {
  /// See also [OrdersController].
  const OrdersControllerFamily();

  /// See also [OrdersController].
  OrdersControllerProvider call(
    dynamic args,
  ) {
    return OrdersControllerProvider(
      args,
    );
  }

  @override
  OrdersControllerProvider getProviderOverride(
    covariant OrdersControllerProvider provider,
  ) {
    return call(
      provider.args,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ordersControllerProvider';
}

/// See also [OrdersController].
class OrdersControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    OrdersController, List<Order>> {
  /// See also [OrdersController].
  OrdersControllerProvider(
    dynamic args,
  ) : this._internal(
          () => OrdersController()..args = args,
          from: ordersControllerProvider,
          name: r'ordersControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ordersControllerHash,
          dependencies: OrdersControllerFamily._dependencies,
          allTransitiveDependencies:
              OrdersControllerFamily._allTransitiveDependencies,
          args: args,
        );

  OrdersControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.args,
  }) : super.internal();

  final dynamic args;

  @override
  FutureOr<List<Order>> runNotifierBuild(
    covariant OrdersController notifier,
  ) {
    return notifier.build(
      args,
    );
  }

  @override
  Override overrideWith(OrdersController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrdersControllerProvider._internal(
        () => create()..args = args,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        args: args,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OrdersController, List<Order>>
      createElement() {
    return _OrdersControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrdersControllerProvider && other.args == args;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, args.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrdersControllerRef on AutoDisposeAsyncNotifierProviderRef<List<Order>> {
  /// The parameter `args` of this provider.
  dynamic get args;
}

class _OrdersControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OrdersController,
        List<Order>> with OrdersControllerRef {
  _OrdersControllerProviderElement(super.provider);

  @override
  dynamic get args => (origin as OrdersControllerProvider).args;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
