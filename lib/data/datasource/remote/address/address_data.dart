import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class AddressData {
  const AddressData(this.api);

  final Api api;

  Future<dynamic> addAddress({
    required String name,
    required String addressLat,
    required String addressCity,
    required String addressLong,
    required String addressStreet,
    required String addressUserId,
  }) async {
    final result = await api.post(AppApiLinks.kAddAddress, {
      "name": name,
      "lat": addressLat,
      "city": addressCity,
      "long": addressLong,
      "userId": addressUserId,
      "street": addressStreet,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> viewAddress(String addressUserId) async {
    final result = await api.post(AppApiLinks.kViewAddress, {
      "userId": addressUserId,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteAddress({required String addressId}) async {
    final result = await api.post(AppApiLinks.kDeleteAddress, {
      "addressId": addressId,
    });

    return result.fold((l) => l, (r) => r);
  }
}
