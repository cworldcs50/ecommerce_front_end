import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class CouponData {
  const CouponData({required this.api});

  final Api api;

  Future<dynamic> getCoupon(String couponName) async {
    final result = await api.post(AppApiLinks.kCheckCoupon, {
      "couponname": couponName,
    });

    return result.fold((l) => l, (r) => r);
  }
}
