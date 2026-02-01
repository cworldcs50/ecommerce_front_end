import 'package:get/get.dart';
import 'custom_apply_coupon_btn.dart';
import 'custom_lang_button.dart';
import 'package:flutter/material.dart';
import 'custom_coupon_code_form_field.dart';
import '../../../core/constants/app_color.dart';

class CustomCartBottomNavBar extends StatelessWidget {
  const CustomCartBottomNavBar({
    super.key,
    required this.price,
    required this.shipping,
    required this.discount,
    required this.onPressed,
    required this.couponName,
    required this.totalPrice,
    required this.goToCheckout,
    required this.showCouponName,
    required this.couponController,
  });

  final bool showCouponName;
  final void Function() onPressed;
  final void Function() goToCheckout;
  final TextEditingController couponController;
  final String price, discount, totalPrice, shipping, couponName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: showCouponName,
            replacement: Text(
              "$couponName coupon applied successfully!",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child: Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomCouponCodeFormField(
                    couponCodeController: couponController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomApplyCouponBtn(onPressed: onPressed),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2.5, color: AppColor.primaryColorDark),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("103".tr),
                    Text(
                      "$price\$",
                      style: const TextStyle(
                        fontFamily: "sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("115".tr),
                    Text(
                      "$discount%",
                      style: const TextStyle(
                        fontFamily: "sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("104".tr),
                    Text(
                      "$shipping\$",
                      style: const TextStyle(
                        fontFamily: "sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "105".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColorDark,
                      ),
                    ),
                    Text(
                      "$totalPrice\$",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColorDark,
                        fontFamily: "sans",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomPlaceOrder(btnTitle: "106".tr, onPressed: goToCheckout),
        ],
      ),
    );
  }
}
