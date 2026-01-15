import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import '../../../data/model/cart_model.dart';
import '../../../core/constants/app_color.dart';
import '../../widget/cart/custom_cart_item.dart';
import '../../widget/cart/custom_cart_title.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/cart/custom_cart_bottom_nav_bar.dart';
import '../../widget/cart/custom_cart_items_count_banner.dart';

class Cart extends GetView<CartControllerImp> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<CartControllerImp>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: ListView(
              children: [
                const CustomCartTitle(),
                const SizedBox(height: 10),
                const CustomCartItemsCountBanner(count: "3"),
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
          );
        },
      ),
      bottomNavigationBar: CustomCartBottomNavBar(
        price: "${controller.totalPrice}",
        shipping: "1200",
        totalPrice: "1200",
      ),
    );
  }
}

/**
 * const CustomCartListTile(
            cartModel: CartModel(
              itemDiscount: "0",
              itemImage: AppImageAssets.laptop,
              itemName: "laptop",
              itemNameAr: "لاب توب",
              itemPrice: "100",
            ),
          ),

          CachedNetworkImage(
              imageUrl: AppImageAssets.avatar,
              height: 50,
              fit: BoxFit.fill,
              errorWidget:
                  (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                    color: AppColor.primaryColorLight,
                  ),
              placeholder:
                  (context, url) => ShaderMask(
                    shaderCallback:
                        (bounds) => LinearGradient(
                          colors: [
                            Colors.grey[300]!,
                            Colors.grey[100]!,
                            Colors.grey[300]!,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ).createShader(bounds),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
            ),
          
 */
