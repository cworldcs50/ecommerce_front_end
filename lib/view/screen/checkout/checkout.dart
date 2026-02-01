import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../controller/checkout/checkout_controller.dart';
import '../../../core/constants/app_image_assets.dart';
import '../../widget/checkout/custom_delivery_type_container.dart';
import '../../widget/checkout/custom_payment_method_container.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.primaryColorDark),
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColorDark,
          ),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder:
            (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "choose payment method",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColorDark,
                    ),
                  ),
                  CustomPaymentMethodContainer(
                    title: "cash",
                    onTap: controller.cash,
                    isChoosed: controller.paymentMethodIndex == 0,
                  ),
                  const SizedBox(height: 10),
                  CustomPaymentMethodContainer(
                    title: "payment cards",
                    onTap: controller.paymentCards,
                    isChoosed: controller.paymentMethodIndex == 1,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "choose delivery type",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColorDark,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomDeliveryTypeContainer(
                          onTap: controller.delivery,
                          deliveryTypeName: "delivery",
                          deliveryTypeImage: AppImageAssets.delivery,
                          isChoosed: controller.deliveryTypeIndex == 0,
                        ),
                      ),
                      Expanded(
                        child: CustomDeliveryTypeContainer(
                          onTap: controller.driveThru,
                          deliveryTypeName: "drive thru",
                          deliveryTypeImage: AppImageAssets.driveThru,
                          isChoosed: controller.deliveryTypeIndex == 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
