import 'package:get/get.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/constants/enums/request_status.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/items/items.dart';
import '../../data/model/items_model.dart';

abstract class ItemsController extends GetxController {
  Future<void> getItems();
  Future<void> initialData();
  Future<void> itemDetails(ItemsModel item);
  Future<void> changeCat(int val, int categoryId);
  void addToFavorites();
}

class ItemsControllerImp extends ItemsController {
  late int selectedId;
  List categories = [];
  late int itemsCategoryId;
  late bool isFavorite;
  List<ItemsModel> items = [];
  RequestStatus? requestStatus;
  late final int userId;
  late final ItemsData _itemsData;

  @override
  Future<void> onInit() async {
    await initialData();
    super.onInit();
  }

  @override
  Future<void> initialData() async {
    isFavorite = false;
    _itemsData = ItemsData(api: Get.find<Services>().api);
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
