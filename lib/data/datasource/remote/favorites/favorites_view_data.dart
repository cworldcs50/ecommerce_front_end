import 'package:dartz/dartz.dart';
import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';
import '../../../../core/constants/enums/request_status.dart';

class FavoritesViewData {
  const FavoritesViewData(this.api);

  final Api api;

  Future<dynamic> getFavoritesItems(String userId) async {
    final Either<RequestStatus, Map<dynamic, dynamic>> result = await api.post(
      AppApiLinks.kGetFavoritesItems,
      {"userId": userId},
    );

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> removeFromFavorites(String userId, String itemId) async {
    final Either<RequestStatus, Map<dynamic, dynamic>> result = await api.post(
      AppApiLinks.kRemoveFromFavorites,
      {"userId": userId, "itemId": itemId},
    );

    return result.fold((l) => l, (r) => r);
  }
}
