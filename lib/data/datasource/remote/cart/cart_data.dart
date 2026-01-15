import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class CartData {
  const CartData({required this.api});

  final Api api;

  Future<dynamic> getCartItems(int userId) async {
    final result = await api.post(AppApiLinks.kGetCartItems, {
      "userId": userId,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> addCartItem(int userId, String itemId) async {
    final result = await api.post(AppApiLinks.kAddElementToCart, {
      "userId": "$userId",
      "itemId": itemId,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> removeCartItem(int userId, String itemId) async {
    final result = await api.post(AppApiLinks.kDeleteElementFromCart, {
      "userId": "$userId",
      "itemId": itemId,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> getCartItemsCount(int userId, String itemId) async {
    final result = await api.post(AppApiLinks.kGetCountItems, {
      "userId": "$userId",
      "itemId": itemId,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> viewCartItems(int userId) async {
    final result = await api.post(AppApiLinks.kMyCart, {"userId": "$userId"});

    return result.fold((l) => l, (r) => r);
  }
}
