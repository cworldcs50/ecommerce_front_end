import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_routes_names.dart';
import '../../data/model/items_model.dart';
import '../../core/services/services.dart';
import '../../data/model/categories_model.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/home/home_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/favorites/favorites.dart';
import '../../view/screen/home/home_body.dart';
import '../../view/screen/profile.dart';
import '../../view/screen/settings/settings.dart';

abstract class HomeController extends GetxController {
  Future<void> getData();
  Future<void> initialData();
  void changeToPage(int pageIndex);
  Future<void> goToCategoryItems(
    List categories,
    int selectedCat,
    int categoryId,
  );
  Future<void> goToCart();
}

class HomeControllerImp extends HomeController {
  late final int id;
  int currentIndex = 0;
  late final String username;
  List<ItemsModel> items = [];
  final List<Widget> pages = const [
    HomeBody(),
    Settings(),
    Profile(),
    Favorites(),
  ];
  final List<String> bottomAppBarBtnsTitle = const ["80", "78", "81", "79"];
  final List<IconData> bottomAppBarBtnsIcons = [
    Icons.home,
    Icons.settings,
    Icons.person_pin_sharp,
    Icons.favorite,
  ];
  RequestStatus? requestStatus;
  List<CategoriesModel> categories = [];
  final SharedPreferences sharedPrefs = Get.find<Services>().prefs;
  final HomeData _homeData = HomeData(api: Get.find<Services>().api);

  @override
  Future<void> onInit() async {
    super.onInit();
    await initialData();
    await getData();
  }

  @override
  Future<void> initialData() async {
    username = sharedPrefs.getString("user_name")!;
    id = sharedPrefs.getInt("user_id")!;
  }

  @override
  Future<void> getData() async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await _homeData.getData();

    requestStatus = handlingData(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        if (response["categories"]["status"] == "success" &&
            response["items"]["status"] == "success") {
          requestStatus = null;

          categories =
              (response["categories"]["data"] as List)
                  .map((category) => CategoriesModel.fromJson(category))
                  .toList();

          items =
              (response["items"]["data"] as List)
                  .map((item) => ItemsModel.fromJson(item))
                  .toList();

          update();
        } else {
          requestStatus = RequestStatus.noData;
          update();
          await Future.delayed(const Duration(seconds: 5), () {
            requestStatus = null;
            update();
          });
        }
      } else {
        update();
        await Future.delayed(const Duration(seconds: 5), () {
          requestStatus = null;
          update();
        });
      }
    }
  }

  @override
  void changeToPage(int pageIndex) {
    currentIndex = pageIndex;
    update();
  }

  @override
  Future<void> goToCategoryItems(
    List categories,
    int selectedCat,
    int itemsCategoryId,
  ) async => await Get.toNamed(
    AppRoutesNames.kItems,
    arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "itemsCategoryId": itemsCategoryId,
    },
  );

  @override
  Future<void> goToCart() async =>
      await Get.toNamed(AppRoutesNames.kCart, arguments: {
        
      });
}
