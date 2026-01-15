import 'package:get/get.dart';
import '../../data/model/cart_model.dart';
import '../../core/services/services.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/cart/cart_data.dart';

abstract class CartController extends GetxController {
  Future<void> initialData();
  Future<void> getCartItems();
  Future<void> addItemToCart(String itemId);
  Future<void> removeCartItem(String itemId);
  Future<void> viewCartItems();
}

class CartControllerImp extends CartController {
  late int totalCount;
  late int totalPrice;
  late final int _userId;
  RequestStatus? requestStatus;
  late final CartData _cartData;
  late List<CartModel> cartItems;

  @override
  Future<void> onInit() async {
    await initialData();
    super.onInit();
  }

  @override
  Future<void> initialData() async {
    cartItems = [];
    totalCount = 0;
    totalPrice = 0;
    _userId = Get.find<Services>().prefs.getInt("user_id")!;
    _cartData = CartData(api: Get.find<Services>().api);
    await viewCartItems();
  }

  @override
  Future<void> getCartItems() async => await _cartData.getCartItems(_userId);

  @override
  Future<void> addItemToCart(String itemId) async {
    final request = await _cartData.addCartItem(_userId, itemId);
    final result = handlingData(request);

    if (result == RequestStatus.success) {
      if (request["status"] == "success") {
        Get.showSnackbar(
          GetSnackBar(title: "${"43".tr}!", message: "${"91".tr}!"),
        );
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
      } else {
        Get.showSnackbar(GetSnackBar(title: "${"67".tr}!", message: "94".tr));
      }
    } else {
      Get.showSnackbar(GetSnackBar(title: "${"67".tr}!", message: "94".tr));
    }
  }

  @override
  Future<void> viewCartItems() async {
    requestStatus = RequestStatus.loading;

    final request = await _cartData.viewCartItems(_userId);
    final result = handlingData(request);

    update();

    if (RequestStatus.success == result) {
      if (request["cartData"]["status"] == "success") {
        cartItems =
            (request["cartData"]["data"] as List)
                .map((cartItem) => CartModel.fromJson(cartItem))
                .toList();

        totalPrice = request["CountAndPriceData"]["total_price"];
        totalCount = request["CountAndPriceData"]["total_count"];
      }
    } else {
      requestStatus = RequestStatus.failure;
    }
    
    requestStatus = null;
    update();
  }
}
