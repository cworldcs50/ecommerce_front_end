import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../widget/cart/custom_cart_item.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/cart/custom_cart_bottom_nav_bar.dart';
import '../../widget/cart/custom_cart_items_count_banner.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "100".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColorDark,
              ),
            ),
          ),
          body: RequestHandlerView(
            status: controller.requestStatus,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                CustomCartItemsCountBanner(count: "${controller.totalCount}"),
                const SizedBox(height: 25),
                ...List.generate(
                  controller.cartItems.length,
                  (index) => CustomCartItem(
                    totalCount: controller.totalCount,
                    addItem:
                        () async => await controller.addItemToCart(
                          "${controller.cartItems[index].itemsId}",
                        ),
                    removeItem:
                        () async => await controller.removeCartItem(
                          "${controller.cartItems[index].itemsId}",
                        ),
                    cartModel: controller.cartItems[index],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: RequestHandlerView(
            status: controller.requestStatus,
            child: CustomCartBottomNavBar(
              shipping: "100",
              couponName: controller.couponName,
              onPressed: controller.applyCoupon,
              goToCheckout: controller.goToCheckout,
              totalPrice: "${controller.totalPrice}",
              showCouponName: controller.showCouponName,
              couponController: controller.couponController,
              discount: "${controller.couponDiscount * 100}",
              price:
                  "${controller.totalPrice - controller.totalPrice * controller.couponDiscount}",
            ),
          ),
        );
      },
    );
  }
}
