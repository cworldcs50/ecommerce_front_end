import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class CheckoutData {
  const CheckoutData({required this.api});

  final Api api;

  Future<dynamic> checkout({
    required int ordersUserId,
    required String ordersPrice,
    required int ordersAddressId,
    required int ordersDeliveryType,
    required int ordersPaymentMethod,
    required int isOrdersApplyCoupon,
    required String couponDiscount,
    required double ordersDeliveryPrice,
  }) async {
    final result = await api.post(AppApiLinks.kOrderCheckout, {
      "ordersPrice": ordersPrice,
      "ordersUserId": ordersUserId.toString(),
      "ordersAddressId": ordersAddressId.toString(),
      "ordersDeliveryType": ordersDeliveryType.toString(),
      "ordersPaymentMethod": ordersPaymentMethod.toString(),
      "isOrdersApplyCoupon": isOrdersApplyCoupon.toString(),
      "ordersDeliveryPrice": ordersDeliveryPrice.toString(),
      "couponDiscount": couponDiscount,
    });

    return result.fold((l) => l, (r) => r);
  }
}
