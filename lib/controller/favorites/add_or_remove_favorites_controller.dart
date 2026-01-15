import 'dart:developer';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/items_model.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/favorites/add_or_remove_favorites_data.dart';

abstract class AddOrRemoveFavoritesController extends GetxController {
  void initialData();
  // Future<void> getFavoritesItems();
  Future<void> addToFavorites(String id);
  void setFavorite(String id, String val);
  Future<void> removeFromFavorites(String id);
  Future<void> favoriteHandler(ItemsModel itemModel);
}

class AddOrRemoveFavoritesControllerImp extends AddOrRemoveFavoritesController {
  late final int userId;
  late List<ItemsModel> favoritesItems;
  late final AddOrRemoveFavoritesData favoritesData;
  late final Map<String, String> isFavorite;
  RequestStatus? requestStatus, getFavoritesItemsRequestStatus;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void initialData() async {
    isFavorite = {};
    favoritesItems = [];
    favoritesData = AddOrRemoveFavoritesData(Get.find<Services>().api);
    userId = Get.find<Services>().prefs.getInt("user_id")!;
  }

  @override
  void setFavorite(String id, String val) {
    isFavorite[id] = val;
    update();
  }

  // ------------------------ Unified Logic ------------------------

  Future<void> _handleFavoriteRequest(
    Future<dynamic> Function() request,
    String itemId,
    String successValue,
    String failMessageKey,
    String successMessageKey,
  ) async {
    final response = await request();
    requestStatus = handlingData(response);

    log("Favorite response($itemId) = $response");

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        setFavorite(itemId, successValue);
        Get.rawSnackbar(title: "✔", message: successMessageKey.tr);
      } else {
        Get.rawSnackbar(title: "⚠", message: failMessageKey.tr);
      }
    } else {
      Get.rawSnackbar(title: "⚠", message: failMessageKey.tr);
    }
  }

  @override
  Future<void> addToFavorites(String itemId) async {
    await _handleFavoriteRequest(
      () => favoritesData.addToFavorites("$userId", itemId),
      itemId,
      "1",
      "85".tr,
      "84".tr,
    );
  }

  @override
  Future<void> removeFromFavorites(String itemId) async {
    await _handleFavoriteRequest(
      () => favoritesData.removeFromFavorites("$userId", itemId),
      itemId,
      "0",
      "87".tr,
      "86".tr,
    );
  }

  @override
  Future<void> favoriteHandler(ItemsModel itemModel) async {
    final String id = "${itemModel.itemsId}";
    final String current = isFavorite[id] ?? (itemModel.isFavorite ? "1" : "0");

    if (current == "1") {
      await removeFromFavorites(id);
    } else {
      await addToFavorites(id);
    }
  }

  Future<void> removeFromFavoritesInFavoritePage(String itemId) async {
    await _handleFavoriteRequest(
      () => favoritesData.removeFromFavorites("$userId", itemId),
      itemId,
      "0",
      "87".tr,
      "86".tr,
    );
  }

}
