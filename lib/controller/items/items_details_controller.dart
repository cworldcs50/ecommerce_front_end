import 'package:get/get.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/model/items_model.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/cart/cart_data.dart';

abstract class ItemsDetailsController extends GetxController {
  Future<void> goToCart();
  Future<void> initialData();
  Future<void> getItemsCount();
  Future<void> addItemToCart(String itemId);
  Future<void> removeCartItem(String itemId);
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late final int _userId;
  late final ItemsModel item;
  String itemCount = "0";
  RequestStatus? requestStatus;
  late final CartData _cartData;

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }

  @override
  Future<void> goToCart() async => await Get.toNamed(AppRoutesNames.kCart);

  @override
  Future<void> initialData() async {
    item = Get.arguments["itemDetails"];
    _cartData = CartData(api: Get.find<Services>().api);
    _userId = Get.find<Services>().prefs.getInt("user_id")!;
    await getItemsCount();
  }

  @override
  Future<void> getItemsCount() async {
    requestStatus = RequestStatus.loading;

    final response = await _cartData.getCartItemsCount(
      _userId,
      "${Get.arguments["itemDetails"].itemsId}",
    );

    update();
    final result = handlingData(response);

    if (RequestStatus.success == result) {
      if (response["status"] == "success") {
        requestStatus = null;
        itemCount = "${response["data"]}";

        update();
      }
    } else {
      update();
    }
  }

  @override
  Future<void> addItemToCart(String itemId) async {
    final request = await _cartData.addCartItem(_userId, itemId);
    final result = handlingData(request);

    if (result == RequestStatus.success) {
      if (request["status"] == "success") {
        Get.showSnackbar(
          GetSnackBar(title: "${"43".tr}!", message: "${"91".tr}!"),
        );
        itemCount = "${int.parse(itemCount) + 1}";

        update();
      } else {
        Get.showSnackbar(GetSnackBar(title: "${"67".tr}!", message: "92".tr));
      }
    } else {
      Get.showSnackbar(GetSnackBar(title: "${"67".tr}!", message: "92".tr));
    }
  }

  @override
  Future<void> removeCartItem(String itemId) async {
    final request = await _cartData.removeCartItem(_userId, itemId);
    final result = handlingData(request);

    if (result == RequestStatus.success) {
      if (request["status"] == "success") {
        Get.showSnackbar(
          GetSnackBar(title: "${"43".tr}!", message: "${"93".tr}!"),
        );

        itemCount = "${int.parse(itemCount) - 1}";

        update();
      } else {
        Get.showSnackbar(GetSnackBar(title: "${"67".tr}!", message: "94".tr));
      }
    } else {
      Get.showSnackbar(GetSnackBar(title: "${"67".tr}!", message: "94".tr));
    }
  }
}
