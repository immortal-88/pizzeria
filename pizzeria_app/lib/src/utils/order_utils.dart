import 'package:pizzeria_shared/pizzeria_shared.dart';

class OrderUtils {
  static OrderStatus mockDeliveryProgress(DateTime createdAt) {
    final timeDifference = DateTime.now().difference(createdAt);

    final deliveryTime = timeDifference.inMinutes;

    if (deliveryTime >= 0 && deliveryTime < 2) {
      return OrderStatus.confirming;
    } else if (deliveryTime >= 2 && deliveryTime < 5) {
      return OrderStatus.makeline;
    } else if (deliveryTime >= 5 && deliveryTime < 10) {
      return OrderStatus.owen;
    } else if (deliveryTime >= 10 && deliveryTime < 13) {
      return OrderStatus.inTheBox;
    } else if (deliveryTime >= 13 && deliveryTime < 25) {
      return OrderStatus.delivery;
    } else {
      return OrderStatus.completed;
    }
  }

  static getOrderStatusTitleAndDescription(OrderStatus status) {
    switch (status) {
      case OrderStatus.confirming:
        return {
          'title': 'Confirming order',
          'description': 'Your order has been confirmed and is being prepared.'
        };
      case OrderStatus.makeline:
        return {
          'title': 'Make Line',
          'description': 'Your order is being prepared.'
        };
      case OrderStatus.owen:
        return {
          'title': 'Oven',
          'description': 'Your order is being backed in the oven.'
        };
      case OrderStatus.inTheBox:
        return {
          'title': 'In the Box',
          'description':
              'Your order is packed in the box and waiting for delivery.'
        };
      case OrderStatus.delivery:
        return {
          'title': 'Delivery',
          'description': 'Your order is on the way.'
        };
      case OrderStatus.completed:
        return {
          'title': 'Completed',
          'description': 'Your order has been delivered.'
        };
    }
  }

  static mockEstimatedDeliveryTime(DateTime createdAt) {
    return createdAt.add(const Duration(minutes: 25));
  }

  static String setStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.confirming:
        return 'assets/lottie/order.json';
      case OrderStatus.makeline:
      case OrderStatus.owen:
      case OrderStatus.inTheBox:
        return 'assets/lottie/cook.json';
      case OrderStatus.delivery:
        return 'assets/lottie/delivery.json';
      case OrderStatus.completed:
        return 'assets/images/checked.png';
    }
  }

  static setOrderStep(OrderStatus status) {
    switch (status) {
      case OrderStatus.confirming:
        return 0;
      case OrderStatus.makeline:
        return 1;
      case OrderStatus.owen:
        return 2;
      case OrderStatus.inTheBox:
        return 3;
      case OrderStatus.delivery:
        return 4;
      case OrderStatus.completed:
        return 5;
    }
  }
}
