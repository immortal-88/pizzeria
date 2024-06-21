import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/features/orders/presentation/controllers/orders_controller.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_service.g.dart';

@Riverpod(keepAlive: true)
class CartService extends _$CartService {
  @override
  List<OrderItem> build() {
    return [];
  }

  void addToCart(OrderItem orderItem) async {
    state = [...state, orderItem];
    print('Added to cart $state');
  }

  void removeFromCart(String id) async {
    state = state.where((element) => element.id != id).toList();
  }

  void updateQuantity(String id, int quantity) async {
    state = state
        .map((e) => e.id == id ? e.copyWith(quantity: quantity) : e)
        .toList();
  }

  void updateItem(OrderItem orderItem) async {
    state = state.map((e) => e.id == orderItem.id ? orderItem : e).toList();
  }

  void clearCart() async {
    state = [];
  }

  void sendOrder(Order order) async {
    final appState = ref.watch(appStateProvider);
    final userId = appState is Authorized ? (appState).login.userId : '';

    ref
        .read(repositoryProvider)
        .ordersApi
        .createOrder(order)
        .then((value) => ref.refresh(ordersControllerProvider(userId)));
  }
}
