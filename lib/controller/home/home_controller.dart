import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/services/firebase_messaging.dart';
import '../../data/datasource/remote/search/search.dart';
import '../../view/screen/profile/profile.dart';
import '../../data/model/items_model.dart';
import '../../core/services/services.dart';
import '../../view/screen/home/home_body.dart';
import '../../data/model/categories_model.dart';
import '../../core/functions/handling_data.dart';
import '../../view/screen/settings/settings.dart';
import '../../core/constants/app_routes_names.dart';
import '../../view/screen/favorites/favorites.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/home/home_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeController extends GetxController {
  Future<void> getData();
  Future<void> initialData();
  void changeToPage(int pageIndex);
  void checkSearch(String val);
  Future<void> onSearchItems();
  Future<void> goToCategoryItems(
    List categories,
    int selectedCat,
    int categoryId,
  );
  Future<void> goToCart();
}

class HomeControllerImp extends HomeController {
  late final int id;
  late bool isSearch;
  int currentIndex = 0;
  late final String username;
  List<ItemsModel> items = [];
  List<ItemsModel> searchedItems = [];
  late final TextEditingController searchController;
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
  final SearchData _searchData = SearchData(api: Get.find<Services>().api);

  @override
  Future<void> onInit() async {
    super.onInit();
    await initialData();
    await getData();
  }

  @override
  Future<void> initialData() async {
    isSearch = false;
    searchController = TextEditingController();
    username = sharedPrefs.getString("user_name")!;
    id = sharedPrefs.getInt("user_id")!;
    await FirebaseMessagingService().fcmInstance.subscribeToTopic("users$id");
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
  void checkSearch(String val) {
    if (searchController.text.isEmpty) {
      isSearch = false;
    }
    update();
  }

  @override
  Future<void> onSearchItems() async {
    if (searchController.text.isEmpty) {
      isSearch = false;
    } else {
      await _getSearchedItems();
    }
  }

  Future<void> _getSearchedItems() async {
    requestStatus = RequestStatus.loading;

    final response = await _searchData.search(searchController.text);

    final result = handlingData(response);

    if (RequestStatus.success == result) {
      isSearch = true;
      if (response["status"] == "success") {
        searchedItems =
            (response["data"] as List)
                .map((item) => ItemsModel.fromJson(item))
                .toList();
      } else {
        requestStatus = RequestStatus.noData;
        searchedItems = [];
        update();
        await Future.delayed(
          const Duration(seconds: 2),
          () => requestStatus = null,
        );
      }
    } else {
      requestStatus = RequestStatus.failure;
      update();
      await Future.delayed(
        const Duration(seconds: 2),
        () => requestStatus = null,
      );
    }
    requestStatus = null;
    update();
  }

  Future<void> goToSearchItemsDetails(ItemsModel itemModel) async =>
      await Get.toNamed(
        AppRoutesNames.kItemsDetails,
        arguments: {"itemDetails": itemModel},
      );

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
  Future<void> goToCart() async => await Get.toNamed(
    AppRoutesNames.kCart,
    arguments: {"itemDetails": items[0]},
  );
}
