import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../data/model/address_model.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/checkout/custom_checkout_container.dart';
import '../../../controller/checkout/checkout_controller.dart';
import '../../widget/checkout/custom_checkout_body_headlines.dart';
import '../../widget/checkout/custom_choose_delivery_type_row.dart';
import '../../widget/checkout/custom_payment_method_container.dart';
import '../../widget/checkout/custom_checkout_shipping_address_card.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: AbsorbPointer(
            absorbing: !controller.canCheckout(),
            child: CustomCheckoutContainer(
              title: "Checkout",
              onPressed: controller.checkout,
              canCheckOut: controller.canCheckout(),
            ),
          ),
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const CustomCheckoutBodyHeadlines(
                  headline: "choose payment method",
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
                const CustomCheckoutBodyHeadlines(
                  headline: "choose delivery type",
                ),
                CustomChooseDeliveryTypeRow(
                  delivery: controller.delivery,
                  driveThru: controller.driveThru,
                  driveThruChoosedCondition: controller.deliveryTypeIndex == 1,
                  deliveryChoosedCondition: controller.deliveryTypeIndex == 0,
                ),
                const SizedBox(height: 10),
                if (controller.deliveryTypeIndex == 0)
                  const CustomCheckoutBodyHeadlines(
                    headline: "choose shipping address",
                  ),
                if (controller.deliveryTypeIndex == 0)
                  Expanded(
                    child: RequestHandlerView(
                      status: controller.addressViewController.requestStatus,
                      child: CustomCheckoutShippingAddressCardsListView(
                        itemBuilder:
                            (context, index) =>
                                CustomCheckoutShippingAddressCard(
                                  onTap:
                                      () => controller.getAddressIndex(
                                        controller
                                            .addressViewController
                                            .addresses[index],
                                      ),
                                  isChoosed: index == controller.choosedAddress,
                                  addressModel:
                                      controller
                                          .addressViewController
                                          .addresses[index],
                                ),
                        addresses: controller.addressViewController.addresses,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomCheckoutShippingAddressCardsListView extends StatelessWidget {
  const CustomCheckoutShippingAddressCardsListView({
    super.key,
    required this.addresses,
    required this.itemBuilder,
  });

  final List<AddressModel> addresses;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: addresses.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: itemBuilder,
    );
  }
}
