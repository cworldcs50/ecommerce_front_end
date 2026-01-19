import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../data/model/items_model.dart';
import '../../core/services/services.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/app_routes_names.dart';
import '../../data/datasource/remote/items/items.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/search/search.dart';

abstract class ItemsController extends GetxController {
  void addToFavorites();
  Future<void> getItems();
  Future<void> initialData();
  Future<void> onSearchItems();
  void checkSearch(String val);
  Future<void> itemDetails(ItemsModel item);
  Future<void> changeCat(int val, int categoryId);
}

class ItemsControllerImp extends ItemsController {
  late bool isSearch;
  late int selectedId;
  late bool isFavorite;
  List categories = [];
  late final int userId;
  late int itemsCategoryId;
  List<ItemsModel> items = [];
  RequestStatus? requestStatus;
  late final ItemsData _itemsData;
  List<ItemsModel> searchedItems = [];
  late final TextEditingController searchController;
  final SearchData _searchData = SearchData(api: Get.find<Services>().api);

  @override
  Future<void> onInit() async {
    await initialData();
    super.onInit();
  }

  @override
  void checkSearch(String val) {
    if (searchController.text.isEmpty) {
      isSearch = false;
    }
    update();
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
                .where((item) => itemsCategoryId == item.itemsCategory)
                .toList();
        if (searchedItems.isEmpty) {
          requestStatus = RequestStatus.noData;
          searchedItems = [];
          update();
          await Future.delayed(
            const Duration(seconds: 2),
            () => requestStatus = null,
          );
        }
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

  @override
  Future<void> onSearchItems() async {
    if (searchController.text.isEmpty) {
      isSearch = false;
    } else {
      await _getSearchedItems();
    }
  }

  @override
  Future<void> initialData() async {
    isSearch = false;
    isFavorite = false;
    _itemsData = ItemsData(api: Get.find<Services>().api);
    searchController = TextEditingController();

    selectedId = Get.arguments["selectedCat"];
    categories = Get.arguments["categories"];
    itemsCategoryId = Get.arguments["itemsCategoryId"];
    userId = Get.find<Services>().prefs.getInt("user_id")!;
    await getItems();
  }

  @override
  Future<void> changeCat(int val, int categoryId) async {
    selectedId = val;
    itemsCategoryId = categoryId;
    await getItems();
    update();
  }

  @override
  Future<void> getItems() async {
    items.clear();
    requestStatus = RequestStatus.loading;
    update();

    final response = await _itemsData.getData(itemsCategoryId, userId);

    requestStatus = handlingData(response);
    update();

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        requestStatus = null;

        items =
            (response["items"] as List)
                .map((item) => ItemsModel.fromJson(item))
                .toList();

        update();
        if (items.isEmpty) {
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
  Future<void> itemDetails(ItemsModel item) async => await Get.toNamed(
    AppRoutesNames.kItemsDetails,
    arguments: {"itemDetails": item},
  );

  @override
  void addToFavorites() {
    isFavorite = !isFavorite;
    update();
  }
}
