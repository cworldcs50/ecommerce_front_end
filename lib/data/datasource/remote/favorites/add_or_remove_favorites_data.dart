import 'package:dartz/dartz.dart';
import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';
import '../../../../core/constants/enums/request_status.dart';

class AddOrRemoveFavoritesData {
  const AddOrRemoveFavoritesData(this.api);

  final Api api;

  Future<dynamic> addToFavorites(String userId, String itemId) async {
    final Either<RequestStatus, Map<dynamic, dynamic>> result = await api.post(
      AppApiLinks.kAddToFavorites,
      {"userId": userId, "itemId": itemId},
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
