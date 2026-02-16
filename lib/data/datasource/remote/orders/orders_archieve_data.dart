import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class OrdersArchieveData {
  const OrdersArchieveData({required this.api});

  final Api api;

  Future<dynamic> getOrders(String userId) async {
    final result = await api.post(AppApiLinks.kOrdersArchieve, {
      "userId": userId,
    });

    return result.fold((l) => l, (r) => r);
  }
}
