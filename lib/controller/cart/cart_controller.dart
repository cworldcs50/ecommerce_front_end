import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../data/model/cart_model.dart';
import '../../core/services/services.dart';
import '../../data/model/coupon_model.dart';
import '../items/items_details_controller.dart';
import '../../core/functions/handling_data.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/cart/cart_data.dart';
import '../../data/datasource/remote/coupon/coupon_data.dart';

abstract class CartController extends GetxController {
  Future<void> initialData();
  Future<void> getCartItems();
  Future<void> viewCartItems();
  Future<void> returnToItemDetails();
  Future<void> addItemToCart(String itemId);
  Future<void> removeCartItem(String itemId);
}

class CartControllerImp extends CartController {
  late int totalCount;
  late int totalPrice;
  late final int _userId;
  late Services services;
  late String couponName;
  late bool showCouponName;
  late double couponDiscount;
  late CouponData _couponData;
  RequestStatus? requestStatus;
  late final CartData _cartData;
  late List<CartModel> cartItems;
  late TextEditingController couponController;
  late final ItemsDetailsControllerImp _itemsDetailsControllerImp;

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
    couponName = "";
    couponDiscount = 0.0;
    showCouponName = true;
    _itemsDetailsControllerImp = Get.find<ItemsDetailsControllerImp>();
    couponController = TextEditingController();
    _userId = Get.find<Services>().prefs.getInt("user_id")!;
    services = Get.find<Services>();
    _cartData = CartData(api: services.api);
    _couponData = CouponData(api: services.api);
    await viewCartItems();
  }

  Future<void> applyCoupon() async {
    if (couponController.text.isNotEmpty) {
      requestStatus = RequestStatus.loading;

      update();

      final request = await _couponData.getCoupon(couponController.text);

      final result = handlingData(request);

      update();

      if (result == RequestStatus.success) {
        if (request["status"] == "success") {
          final CouponModel couponModel = CouponModel.fromJson(request["data"]);
          couponName = couponModel.couponName;
          couponDiscount = couponModel.couponDiscount;
          requestStatus = RequestStatus.success;
          showCouponName = false;
        } else {
          Get.showSnackbar(
            const GetSnackBar(
              title: "Oops!",
              message: "coupon expired or not found!",
            ),
          );
          requestStatus = RequestStatus.noData;
        }
      } else {
        Get.showSnackbar(
          const GetSnackBar(title: "Error!", message: "Please try again later"),
        );
        requestStatus = RequestStatus.serverFailure;
      }
    }
    await Future.delayed(const Duration(seconds: 2), () {
      requestStatus = null;
      couponController.clear();
      update();
    });
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

    await viewCartItems();
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

    await viewCartItems();
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
      } else {
        _resetValues();
      }
    } else {
      requestStatus = RequestStatus.failure;
      await Future.delayed(const Duration(seconds: 2), () {
        requestStatus = null;
        update();
      });
    }

    requestStatus = null;
    update();
  }

  void _resetValues() {
    cartItems = [];
    totalCount = 0;
    totalPrice = 0;
  }

  @override
  Future<void> returnToItemDetails() async {
    await _itemsDetailsControllerImp.getItemsCount();
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
    couponController.dispose();
  }
}
