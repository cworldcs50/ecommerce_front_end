import 'dart:developer';
import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class ItemsData {
  const ItemsData({required this.api});

  final Api api;

  Future<dynamic> getData(int itemsCategoryId, int userId) async {
    final result = await api.post(AppApiLinks.kItems, {
      "user_id": userId.toString(),
      "category_id": itemsCategoryId.toString(),
    });

    log("getData: result=$result");
    return result.fold((l) => l, (r) => r);
  }
}
