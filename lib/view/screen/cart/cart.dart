import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../widget/cart/custom_cart_item.dart';
import '../../widget/cart/custom_cart_title.dart';
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
          body: RequestHandlerView(
            status: controller.requestStatus,
            child: ListView(
              children: [
                CustomCartTitle(onPressed: controller.returnToItemDetails),
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

          bottomNavigationBar: CustomCartBottomNavBar(
            price: "${controller.totalPrice}",
            shipping: "1200",
            totalPrice: "1200",
          ),
        );
      },
    );
  }
}

