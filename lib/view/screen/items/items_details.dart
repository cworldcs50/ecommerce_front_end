import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/class/request_handler_view.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/functions/translate_data_base.dart';
import '../../widget/items_details/custom_image_stack.dart';
import '../../../controller/items/items_details_controller.dart';
import '../../widget/items_details/custom_add_to_cart_material_btn.dart';
import '../../widget/items_details/custom_price_and_quantity_of_item_row.dart';

class ItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomAddToCartMaterialBtn(onPressed: controller.goToCart),
      ),
      body: GetBuilder<ItemsDetailsControllerImp>(
        builder:
            (controller) => RequestHandlerView(
              status: controller.requestStatus,
              child: ListView(
                children: [
                  const CustomImageStack(),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translateDataBase(
                            controller.item.itemsName,
                            controller.item.itemsNameAr,
                          ),
                          style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomPriceAndQuantityOfItemRow(
                          itemsModel: controller.item,
                          count: int.parse(controller.itemCount),
                          price: controller.item.itemsPriceAfterDiscount,
                          add:
                              () async => await controller.addItemToCart(
                                "${controller.item.itemsId}",
                              ),
                          remove:
                              () async => await controller.removeCartItem(
                                "${controller.item.itemsId}",
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          translateDataBase(
                            controller.item.itemsDescription,
                            controller.item.itemsDescriptionAr,
                          ),
                          style: TextStyle(
                            color: Colors.grey[550],
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "108".tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          spacing: 15,
                          children: List.generate(2, (index) {
                            return Container(
                              width: 80,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColor.primaryColorDark,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Red",
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

/**
 * Container(
                      width: 80,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorDark,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Red",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  
 */
