import 'dart:developer';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../core/functions/handling_data.dart';
import '../../data/model/favorite_item_model.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/favorites/favorites_view_data.dart';

abstract class FavoritesViewController extends GetxController {
  void initialData();
  Future<void> getFavoritesItems();
  Future<void> removeFromFavoritesPage(String itemId);
  Future<void> itemDetails(FavoriteItemModel favoriteItemModel);
}

class FavoritesViewControllerImp extends FavoritesViewController {
  late final int userId;
  late List<FavoriteItemModel> favoritesItems;
  late final FavoritesViewData _favoritesViewData;
  RequestStatus? getFavoritesItemsRequestStatus, requestStatus;

  @override
  void onInit() async {
    initialData();
    await getFavoritesItems();
    super.onInit();
  }

  @override
  void initialData() {
    favoritesItems = [];
    userId = Get.find<Services>().prefs.getInt("user_id")!;
    _favoritesViewData = FavoritesViewData(Get.find<Services>().api);
  }

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
        Get.rawSnackbar(title: "✔", message: successMessageKey.tr);
      } else {
        Get.rawSnackbar(title: "⚠", message: failMessageKey.tr);
      }
    } else {
      Get.rawSnackbar(title: "⚠", message: failMessageKey.tr);
    }
  }

  @override
  Future<void> removeFromFavoritesPage(String itemId) async {
    favoritesItems.removeWhere(
      (element) => element.itemsId.toString() == itemId,
    );

    await _handleFavoriteRequest(
      () => _favoritesViewData.removeFromFavorites("$userId", itemId),
      itemId,
      "0",
      "87".tr,
      "86".tr,
    );

    update();
  }

  @override
  Future<void> itemDetails(FavoriteItemModel favoriteItemModel) async =>
      await Get.toNamed(
        AppRoutesNames.kItemsDetails,
        arguments: {"itemDetails": favoriteItemModel.fromFavoriteToItem()},
      );

  @override
  Future<void> getFavoritesItems() async {
    getFavoritesItemsRequestStatus = RequestStatus.loading;
    update();

    final response = await _favoritesViewData.getFavoritesItems("$userId");
    getFavoritesItemsRequestStatus = handlingData(response);

    if (getFavoritesItemsRequestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        favoritesItems =
            (response["data"] as List)
                .map((favoriteItem) => FavoriteItemModel.fromJson(favoriteItem))
                .toList();

        update();
      } else {
        getFavoritesItemsRequestStatus = null;
        update();
      }
    } else {
      update();
      await Future.delayed(const Duration(seconds: 5), () {
        getFavoritesItemsRequestStatus = null;
        update();
      });
      await Get.defaultDialog(title: "${"67".tr}!", middleText: "${"88".tr}!");
    }
  }
}
